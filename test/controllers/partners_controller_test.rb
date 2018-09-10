require 'test_helper'

class PartnersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get partners_index_url
    assert_response :success
  end

  test "should get show" do
    get partners_show_url
    assert_response :success
  end

end
