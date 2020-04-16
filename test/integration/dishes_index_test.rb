require 'test_helper'

class DishesIndexTest < InteractiveTest
  
  def setup
    @user = users(:john)
    super
    @edit_dish = dishes(:edit_dish)
  end
  
  test "newly added dish comes first in the list" do
    login_as_user(@user)
    
    visit new_dish_path
    fill_in('dish[name]', :with => 'first dish')
    click_button('Save')
    
    visit dishes_path
    page.must_have_css 'table.borderless'
    
    within(:css, 'table') do
      first('td span').must_have_content(Dish.order(:updated_at).last.name)
    end
  end
  
  test "most recently edited dish comes first in the list" do
    login_as_user(@user)
    
    visit edit_dish_path(@edit_dish)
    fill_in('dish[name]', :with => 'edited first dish')
    click_button('Save')
    
    visit dishes_path
    page.must_have_css 'table.borderless'
    
    within(:css, 'table') do
      first('td span').must_have_content(Dish.order(:updated_at).last.name)
    end
  end
 
end
