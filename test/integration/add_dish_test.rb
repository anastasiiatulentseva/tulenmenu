require 'test_helper'

class AddDishTest < ActionDispatch::IntegrationTest

  def setup
    @dish = dishes(:borsch)
  end
  
  test "Add new dish" do
    get new_dish_path
    assert_select 'div.form-group'
    #Invalid submission
    assert_no_difference 'Dish.count' do
      post dishes_path, dish: { name: "" }
    end
    assert_select 'div#error_explanation'
    #Valid submission
    assert_difference 'Dish.count', 1 do
      post dishes_path, dish: { name: @dish.name }
    end
    assert_not flash.empty?
    assert_redirected_to new_dish_path
    get dishes_path
    assert_match @dish.name, response.body
    assert_match @dish.picture.to_s, response.body
  end
  
end
