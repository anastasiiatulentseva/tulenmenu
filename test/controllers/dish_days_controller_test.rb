require 'test_helper'

class DishDaysControllerTest < ActionController::TestCase
  
  def setup
    @dish = dishes(:borsch)
  end
  
  test "should redirect on correct assignment" do
    assert_difference 'DishDay.count', 1 do
      post :create, dish_day: { dish_id: @dish.id, day: Date.today }
    end
    assert_redirected_to new_dish_day_url
  end
  
  test "should render new when wrong assignment" do
    assert_no_difference 'DishDay.count' do
      post :create, dish_day: { dish_id: @dish.id, day: Date.yesterday }
    end
    assert_template "new"
  end
  
  
  
end
