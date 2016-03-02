require "test_helper"

class UserLoginTest < InteractiveTest
 
  def setup
    @user = users(:john)
    super
  end
  
  test "should log in user" do
    visit new_user_session_path
    page.must_have_css "form#new_user"
    fill_in('user[email]', with: @user.email)
    fill_in('user[password]', with: 'password')
    click_button('Log in')
  end
 
end
