require "test_helper"

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get notifcations_index_url
    assert_response :success
  end
end
