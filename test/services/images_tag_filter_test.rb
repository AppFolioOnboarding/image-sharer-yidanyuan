require 'test_helper'

class ImagesTagFilterTest < ActiveSupport::TestCase
  def test_tag_filter__filter_image_by_tag_and_display
    images = [
      { url: 'https://66.media.tumblr.com/d987cc268b9787dd9f2fffee9d622394/tumblr_pvizw3RxM61v6ev98o1_r1_1280.jpg',
        tag_list: %w[tag1] },
      { url: 'https://66.media.tumblr.com/342197191ef2016111b4d863b511fe9c/tumblr_pr5mknDjXs1v6ev98o2_1280.jpg',
        tag_list: %w[tag1 tag2] },
      { url: 'https://66.media.tumblr.com/a09fcb4bda9167908879928ac268f68e/tumblr_pr5mknDjXs1v6ev98o3_1280.jpg',
        tag_list: %w[tag2 tag3] },
      { url: 'https://66.media.tumblr.com/a09fcb4bda9167908879928ac268f68e/tumblr_pr5mknDjXs1v6ev98o3_1280.jpg',
        tag_list: %w[tag2 tag3] }
    ]
    Image.create!(images)
    assert_equal ImagesTagFilter.filter(tag: 'tag1').length, 2
    assert_equal ImagesTagFilter.filter(tag: 'tag2').length, 3
    assert_equal ImagesTagFilter.filter(tag: 'tag3').length, 2
    assert_equal ImagesTagFilter.filter(tag: %w[tag3 tag2]).length, 2
    assert_equal ImagesTagFilter.filter(tag: 'FakeTag').length, 0
    assert_equal ImagesTagFilter.filter(tag: '').length, 0
    assert_equal ImagesTagFilter.filter(tag: nil).length, 4
  end
end
