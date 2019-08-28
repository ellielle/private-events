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
    assert_select "div.events-list"
  end

  test "events page shows no events when not logged in" do
    get events_path
    assert_template 'events/index'
    assert_template 'events/_logged_out'
    assert_select "div.events-list", count: 0
  end
=begin
  test "user's profile page lists events created by them" do
    log_in_as(@user)
    get profile_path
    assert_template 'users/show'
    assert_select "div.event-title" do |event|
      event.count == @user.events.count
    end
  end
=end
end
