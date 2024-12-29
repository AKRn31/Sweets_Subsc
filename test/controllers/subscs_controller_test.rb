require "test_helper"

class SubscsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subscs_index_url
    assert_response :success
  end

  test "should get show" do
    get subscs_show_url
    assert_response :success
  end
end
