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
    assert_select "div.events-list", count: 26
  end

  test "events page shows no events when not logged in" do
    get events_path
    assert_template 'events/index'
    assert_template 'events/_logged_out'
    assert_select "div.events-list", count: 0
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

  test "user's profile page lists events created by them" do
    log_in_as(@user)
    get profile_path
    assert_template 'users/show'
    assert_select "li.event-title", count: 1
  end
end
