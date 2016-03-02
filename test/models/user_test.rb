require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:john)
  end

  test "should be valid" do
    assert @user.valid?
  end
  
  test "user name should be from 3 and 50 characters" do
    @user.name = "aa"
    assert_not @user.valid?
    @user.name = "a" * 51
    assert_not @user.valid?
  end


end