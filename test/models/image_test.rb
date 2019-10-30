require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def test_image_model__invalid_with_null_url
    test_url = ''
    image = Image.new(url: test_url)

    assert_not image.valid?
  end

  def test_image_model__invalid_with_incorrect_url
    test_url = 'www.google.com'
    image = Image.new(url: test_url)

    assert_not image.valid?
  end

  def test_image_model__valid_url
    test_url = 'https://66.media.tumblr.com/d987cc268b9787dd9f2fffee9d622394/tumblr_pvizw3RxM61v6ev98o1_r1_1280.jpg'
    image = Image.new(url: test_url)

    assert image.valid?
  end
end
