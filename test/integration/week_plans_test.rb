require 'test_helper'

class WeekPlansTest < InteractiveTest
  
  def setup
    @user = users(:john)
    super
    @dish = dishes(:pancakes)
  end
  
  test "should show correct list of dishes" do
    login_as_user(@user)
    
    visit week_plans_path
    
    #No dishes for the week
    page.must_have_css 'p.alert-info'
    page.wont_have_css 'ul.list-group'
    
    visit new_dish_day_path
    select Date.today.year, :from => "dish_day[day(1i)]"
    select @dish.name, :from => "dish_day[dish_id]"
    click_button('Save')  
    
    #Week menu exists
    visit week_plans_path
    page.must_have_css 'ul.list-group'
    page.must_have_css 'ol.list-inline'
    assert_equal page.all('li#week_plan_dishes').count, DishDay.where(day: Date.today.all_week).count    
  end
  
end
