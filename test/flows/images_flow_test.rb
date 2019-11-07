require 'flow_test_helper'

class ImagesFlowTest < FlowTestCase
  def test_create_flow__create_image_success_with_valid_url
    images_index_page = PageObjects::Images::IndexPage.visit

    new_image_page = images_index_page.create_image!

    tags = 'tag, tag2'
    image_url = 'https://media3.giphy.com/media/EldfH1VJdbrwY/200.gif'

    image_show_page = new_image_page.create_image!(imgurl: image_url,
                                                   taglist: tags).as_a(PageObjects::Images::ShowImagePage)

    assert_equal image_url, image_show_page.image_url

    images_index_page = PageObjects::Images::IndexPage.visit

    assert images_index_page.showing_image?(url: image_url, tags: tags)
  end

  def test_create_flow__create_image_fail_with_invalid_url
    images_index_page = PageObjects::Images::IndexPage.visit

    new_image_page = images_index_page.create_image!

    tags = 'tag1'
    index_page = new_image_page.create_image!(
      imgurl: 'invalid',
      taglist: tags
    ).as_a(PageObjects::Images::IndexPage)

    assert_equal 'Invalid Url!', index_page.flash_message.text
  end

  def test_delete_flow__delete_image_in_show_page_success_with_valid_input
    img_to_keep_url = 'http://ghk.h-cdn.co/assets/16/09/980x490/landscape-1457107485-gettyimages-512366437.jpg'
    img_to_delete_url = 'http://www.ugly-cat.com/ugly-cats/uglycat041.jpg'
    Image.create!([
      { url: img_to_keep_url, tag_list: 'keep' },
      { url: img_to_delete_url, tag_list: 'delete' }
    ])

    images_index_page = PageObjects::Images::IndexPage.visit
    assert_equal 2, images_index_page.images.count
    assert images_index_page.showing_image?(url: img_to_delete_url)
    assert images_index_page.showing_image?(url: img_to_keep_url)

    image_to_delete = images_index_page.images.find do |image|
      image.url == img_to_delete_url
    end
    image_show_page = image_to_delete.view!

    image_show_page.delete do |confirm_dialog|
      assert_equal 'Are you sure you want to delete this image?', confirm_dialog.text
      confirm_dialog.dismiss
    end

    images_index_page = image_show_page.delete_and_confirm!
    assert_equal 'Image successfully deleted!', images_index_page.flash_message.text

    assert_equal 1, images_index_page.images.count
    assert_not images_index_page.showing_image?(url: img_to_delete_url)
    assert images_index_page.showing_image?(url: img_to_keep_url)
  end
end
