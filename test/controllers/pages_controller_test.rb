require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:ellie)
  end

  test "should get home" do
    get root_url
    assert_response :success
  end

  test "should have proper links on navbar when logged in or out" do
    log_in_as(@user)
    get root_url
    assert_select 'a[href=?]', profile_path
    assert_select 'a[href=?]', logout_path
    assert_select 'a[href=?]', create_path
    assert_select 'a[href=?]', root_path
    assert_select 'a[href=?]', events_path
    delete logout_path
    follow_redirect!
    assert_select 'a[href=?]', profile_path, count: 0
    assert_select 'a[href=?]', logout_path, count: 0
    assert_select 'a[href=?]', create_path, count: 0
  end

end
