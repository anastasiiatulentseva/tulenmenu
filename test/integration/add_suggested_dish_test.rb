require "test_helper"

class AddSuggestedDishTest < InteractiveTest
  
  def setup
    @user = users(:john)
    super
  end
  
  test 'should save correct suggested dish' do
   login_as_user(@user)
    
    visit root_path
    click_button('Do it')
    page.must_have_css 'div#suggested_dishes_modal'
    fill_in('suggested_dish[name]', with: 'new')
    fill_in('suggested_dish[comment]', with: 'comment')
    click_button('Save')
    
    page.must_have_css 'div#flash_messages'
    visit suggested_dishes_path
    page.must_have_content 'New'
  end
  
  test 'should show error explanation when posting incorrect suggested dish' do
    login_as_user(@user)

    visit root_path
    click_button('Do it')
    page.must_have_css 'div#suggested_dishes_modal'
    fill_in('suggested_dish[name]', with: "n")
    fill_in('suggested_dish[comment]', with: "n")
    click_button('Save')

    page.must_have_css 'div#error_explanation'
  end

end
