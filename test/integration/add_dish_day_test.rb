require 'test_helper'

class AddDishDayTest < ActionDispatch::IntegrationTest
  
  def setup
    @dish = dishes(:borsch)
  end
  
  test "Add new dish_day" do
    get new_dish_day_path
    assert_template 'new'
    assert_select 'form.form-horizontal'
    #Invalid submission
    assert_no_difference 'DishDay.count' do
      post dish_days_path, dish_day: {dish_id: @dish.id, day: Date.yesterday}
    end
    assert_select 'div#error_explanation'
    assert_template 'dish_days/new'
    #Valid submission
    assert_difference 'DishDay.count', 1 do
      post dish_days_path, dish_day: {dish_id: @dish.id, day: Date.today}
    end
    assert_not flash.empty?
    assert_redirected_to new_dish_day_url
    
  end
  
end
