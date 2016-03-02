module UserLogin
  
  def login_as_user(name)
    visit new_user_session_path
    fill_in('user[email]', with: @user.email)
    fill_in('user[password]', with: 'password')
    click_button('Log in')
  end
  
end