require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:ellie)
  end

  test "should be valid" do
    @user.valid?
  end

  test "should be invalid" do
    @user.username = "  "
    assert_not @user.valid?
  end
end
