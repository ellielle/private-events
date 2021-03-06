require 'test_helper'

class EventsDisplayTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:ellie)
  end

  test "events page shows all events when logged in" do
    log_in_as(@user)
    get events_path
    assert_template 'events/index'
    assert_template 'events/_logged_in'
    assert_select 'div.events-list' do
      assert_select 'li', count: 52
    end
  end

  test "events page redirects when not logged in" do
    get events_path
    assert_redirected_to login_path
  end

  test "should get show page for a logged in user, redirect if not logged in" do
    log_in_as(@user)
    get profile_path
    assert_response :success
    delete logout_path
    follow_redirect!
    get profile_path
    assert_redirected_to root_path
    assert_not flash.empty?
  end
end
