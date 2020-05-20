require 'test_helper'

class ProductlistingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get productlistings_index_url
    assert_response :success
  end

end
