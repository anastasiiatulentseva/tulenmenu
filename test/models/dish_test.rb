require 'test_helper'

class DishTest < ActiveSupport::TestCase
  
  def setup
    @dish = Dish.new(name: "borch", picture: "b.jpg")
  end
  
  test "should be valid" do
    assert @dish.valid?
  end
  
  test "name should be present" do
    @dish.name = "   "
    assert_not @dish.valid?
  end
  
  test "name should be from 3 and 50 characters" do
    @dish.name = "aa"
    assert_not @dish.valid?
    @dish.name = "a" * 51
    assert_not @dish.valid?
  end
  
end
