require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_index__issue_one
    get root_path
    assert_response :success
    assert_select 'h1', 'Welcome to the Image Sharer'
  end
end
