require 'test_helper'

class FlatsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get index" do
    get flats_index_url
    assert_response :success
  end

  test "should get show" do
    get flats_show_url
    assert_response :success
  end

end
