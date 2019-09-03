require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:ellie)
  end

  test "should get create" do
    get create_path
    assert_response :success
  end

  test "should get index" do
    get events_path
    assert_response :success
  end

  test "should get show" do
    get event_path(events(:birthday))
  end
end
