require "test_helper"

class MaintenanceTicketsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get maintenance_tickets_index_url
    assert_response :success
  end

  test "should get create" do
    get maintenance_tickets_create_url
    assert_response :success
  end
end
