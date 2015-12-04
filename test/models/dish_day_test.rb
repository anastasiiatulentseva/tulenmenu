require 'test_helper'

class DishDayTest < ActiveSupport::TestCase
 
  def setup
    @dish = dishes(:borsch)
    @dish_day = dish_days(:one)
    @dish_day_invalid = dish_days(:two)
  end
 
  test "should be valid" do
    assert @dish_day.valid?
  end
  
  test "dish id should be present" do
    @dish_day.dish_id = nil
    assert_not @dish_day.valid?
  end
  
  test "day should be present" do
    @dish_day.day = nil
    assert_not @dish_day.valid?
  end
  
  test "day should be today or later" do
    @dish_day.day = Date.yesterday
    assert_not @dish_day.valid?
  end
    
  
end








