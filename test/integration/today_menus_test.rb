require 'test_helper'

class TodayMenusTest < ActionDispatch::IntegrationTest
 
  def setup
    @dish = dishes(:borsch)
  end
  
  
  test "should show correct result for today's menu" do
    get today_menus_path
    assert_template 'index'
    #No dishes for today
    assert_select 'p.alert-info'
    assert_select 'ul.list-inline', false
    
    get new_dish_day_path
    post dish_days_path, dish_day: {dish_id: @dish.id, day: Date.today}
    
    #Today's menu exists
    get today_menus_path
    assert_select 'p.alert-info', false 
    assert_select 'ul.list-inline' do
      assert_select 'li', DishDay.where(day: Date.today).count
    end    
  end
 
end
