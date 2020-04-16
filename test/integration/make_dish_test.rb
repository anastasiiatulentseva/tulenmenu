require "test_helper"

class MakeDishTest < InteractiveTest
  
  def setup
    @user = users(:john)
    super
    @pizza = suggested_dishes(:pizza)
  end
  
  test "suggested dish should upgrade to dish" do
    login_as_user(@user)
    
    visit suggested_dishes_path
    page.must_have_css 'ul#suggested_dishes'
    within(:css, "li#suggested-dish-#{@pizza.id}") do
      find_link('Make a dish').click
    end
    page.must_have_css 'form.edit_dish'
    visit dishes_path
    page.must_have_content(@pizza.name)
  end
  
  
  
end
