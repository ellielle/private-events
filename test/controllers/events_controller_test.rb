require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:ellie)
  end

  test "should get create" do
    get create_path
    assert_response :success
  end

  test "should get show for a logged in user, redirect if not logged in" do
    log_in_as(@user)
    get profile_path
    assert_response :success
    delete logout_path
    follow_redirect!
    get profile_path
    assert_redirected_to root_path
    assert_not flash.empty?
  end

  test "should get index" do
    get events_path
    assert_response :success
  end

end
