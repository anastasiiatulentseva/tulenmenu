require 'test_helper'

class WeekPlansTest < ActionDispatch::IntegrationTest
  
  def setup
    @dish = dishes(:borsch)
  end
  
  test "should show correct list of dishes" do
    get week_plans_path
    assert_template 'index'
    
    #No dishes for the week
    assert_select 'p.alert-info'
    assert_select 'ul.list-group', false
    
    get new_dish_day_path
    post dish_days_path, dish_day: {dish_id: @dish.id, day: Date.today}
    
    #Week menu exists
    get week_plans_path
    assert_select 'ul.list-group'
    assert_select 'ol.list-inline' do
      assert_select 'li#week_plan_dishes', DishDay.where(day: Date.today.all_week).count
    end
    
  end
  
end
