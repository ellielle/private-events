require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "should increase the number of users" do
    assert_difference "User.count", 1 do
      post signup_path, params: { user: { username: "testuser" }}
    end
    follow_redirect!
    assert_template 'pages/home'
    assert_not flash.empty?
  end

  test "should not increase the number of users" do
    assert_no_difference "User.count" do
      post signup_path, params: { user: { username: "   " }}
    end
    assert_template 'users/new'
    assert_select 'div#error-messages'
  end

  test "should redirect when trying to visit a profile while not logged in" do
    get profile_path(users(:ellie))
    assert_redirected_to root_path
  end
end
