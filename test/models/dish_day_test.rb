require 'test_helper'

class DishDayTest < ActiveSupport::TestCase
 
  def setup
    @dish = dishes(:borsch)
    @dish_day = dish_days(:one)
    @dish_day_past = dish_days(:two)
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
  
  test "dish should not go twice or more a day" do
    dish_day = DishDay.new(dish_id: 3, day: Date.today)
    dish_day.save
    assert_not dish_day.persisted?
  end
  
  test "day should be today or later when create" do
    dish_day = DishDay.new(day: Date.yesterday)
    dish_day.save

    assert_not dish_day.persisted?
    assert_not dish_day.valid?
  end
  
  test "day can be in the past when save" do
    @dish_day_past.day = 2.days.ago
    @dish_day_past.save
    assert @dish_day_past.persisted?
    assert @dish_day_past.valid?
  end
    
  
end








