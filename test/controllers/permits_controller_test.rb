require 'test_helper'

class PermitsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get permits_index_url
    assert_response :success
  end

  test "should get show" do
    get permits_show_url
    assert_response :success
  end

end
