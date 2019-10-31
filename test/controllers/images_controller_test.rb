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

  def test_show__redirect_to_index_with_invalid_url
    get image_path('invalid')

    assert_redirected_to images_path
  end

  def test_index__successfully_display_all_images_that_are_valid
    Image.destroy_all

    # Three test images with valid url
    image_urls = [
      { url: 'https://66.media.tumblr.com/62659764fe629de15fd79d81835222a3/' \
      'tumblr_pvizw3RxM61v6ev98o2_r1_1280.jpg' },
      { url: 'https://66.media.tumblr.com/bdd03d03dfe2af5fe7a704882340ca66/' \
      'tumblr_pvizw3RxM61v6ev98o8_r2_1280.jpg' },
      { url: 'https://66.media.tumblr.com/f05809479537b94b46e0446c8f808ef1/' \
      'tumblr_pvizw3RxM61v6ev98o9_r2_1280.jpg' }
    ]

    Image.create!(image_urls)

    get images_path
    assert_response :success

    # Make sure there are three images displayed on the page that has matching urls and each has width <= 400px
    assert_select 'img', 3 do |images|
      image_urls_reversed = image_urls.reverse
      images.each_with_index do |im, index|
        assert im.attributes['width'].value.to_i <= 400
        assert_equal image_urls_reversed[index][:url], im.attributes['src'].value
      end
    end
  end

  def test_seed__load_and_display_20_seeds_when_db_is_created
    Image.destroy_all

    Rails.application.load_seed
    assert_equal Image.count, 20
  end
end
