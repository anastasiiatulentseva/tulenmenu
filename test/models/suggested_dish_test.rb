require 'test_helper'

class SuggestedDishTest < ActiveSupport::TestCase
  
  def setup
    @suggested_dish = suggested_dishes(:pizza)
  end
  
  
  test "should be valid" do
    assert @suggested_dish.valid?
  end
  
  test "name should be present" do
    @suggested_dish.name = "   "
    assert_not @suggested_dish.valid?
  end
  
  test "name should be between 3 and 50 characters" do
    @suggested_dish.name = "aa"
    assert_not @suggested_dish.valid?
    @suggested_dish.name = "a" * 51
    assert_not @suggested_dish.valid?
    @suggested_dish.name = "aaa"
    assert @suggested_dish.valid?
  end
  
  test "comment should be present" do
    @suggested_dish.comment = "   "
    assert_not @suggested_dish.valid?
  end
  
  test "comment should be between 3 and 250 characters" do
    @suggested_dish.comment = "aa"
    assert_not @suggested_dish.valid?
    @suggested_dish.comment = "a" * 251
    assert_not @suggested_dish.valid?
    @suggested_dish.comment = "aaa"
    assert @suggested_dish.valid?
  end
  
end
