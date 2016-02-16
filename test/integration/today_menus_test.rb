require 'test_helper'

class TodayMenusTest < InteractiveTest
 
  def setup
    @dish = dishes(:borsch)
  end
  
  
  test "should show correct result for today's menu" do
    visit today_menus_path
   
    #No dishes for today
    page.must_have_css 'p.alert-info'
    page.wont_have_css 'ul.list-inline'
    
    visit new_dish_day_path
    select Date.today.year, :from => "dish_day[day(1i)]"
    select Date::MONTHNAMES[Date.today.month], :from => 'dish_day[day(2i)]'
    select Date.today.day, :from => "dish_day[day(3i)]"
    select @dish.name, :from => "dish_day[dish_id]"
    click_button('Save')
        
        
    #Today's menu exists
    visit today_menus_path
    page.wont_have_css 'p.alert-info'
    page.must_have_css 'ul.list-inline'
    assert_equal page.all('li#dish_day').count, DishDay.where(day: Date.today).count
    page.must_have_css 'li#dish_day' 
  end
 
end
