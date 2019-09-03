require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:ellie)
  end

  test "should get create" do
    get create_path
    assert_response :success
  end

  test "should get index when logged in" do
    log_in_as(@user)
    get events_path
    assert_response :success
  end

  test "should redirect to login page when logged out" do
    get events_path
    assert_redirected_to login_path
  end

  test "should get show" do
    get event_path(events(:birthday))
  end
end
