require "test_helper"

class OpportunitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get opportunities_index_url
    assert_response :success
  end

  test "should get show" do
    get opportunities_show_url
    assert_response :success
  end
end
