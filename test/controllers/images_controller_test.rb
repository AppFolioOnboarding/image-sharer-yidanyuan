require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_index__issue_one
    get root_path
    assert_response :success
    assert_select 'h1', 'Welcome to the Image Sharer'
  end

  def test_index__issue_two
    get root_path
    assert_response :success
    assert_select 'h3', 'Upload image using url'
  end

  def test_new__success
    get new_image_path

    assert_response :success
    assert_select 'h1', count: 1, text: 'Please upload image by providing a valid image url'
  end

  def test_create__success_with_valid_url
    Image.destroy_all

    # a valid image url
    test_url = 'https://66.media.tumblr.com/d987cc268b9787dd9f2fffee9d622394/tumblr_pvizw3RxM61v6ev98o1_r1_1280.jpg'

    # make sure a valid image can be successfully saved to the database
    assert_difference('Image.count') do
      post images_path, params: { image: { url: test_url } }
    end
    test_image = Image.find_by url: test_url
    assert_redirected_to image_path(test_image)
  end

  def test_create__fail_with_invalid_url
    Image.destroy_all

    test_url = 'google'
    image = Image.new(url: test_url)

    # make sure an invalid image cannot be successfully saved to the database
    assert_difference 'Image.count', 0 do
      post images_path, params: { image: { url: image.url } }
    end

    # user then is redirected to the form
    assert_redirected_to new_image_path
  end

  def test_show__success_with_valid_url
    Image.destroy_all

    @image = Image.create!(url: 'https://i.pinimg.com/originals/28/4d/01/284d014be8091c2ac52fa9708163bfd6.jpg')
    get image_path(@image)

    assert_response :success
    assert_select 'img', src: @image.url
  end
end
