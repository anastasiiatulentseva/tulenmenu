require 'test_helper'

class DishesIndexTest < ActionDispatch::IntegrationTest
 
  test "dishes index should be shown correclty" do
    get dishes_path
    assert_template 'dishes/index'
    assert_select 'ul.dishes'
  end
  
  
 
end
