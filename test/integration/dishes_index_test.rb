require 'test_helper'

class DishesIndexTest < InteractiveTest
 
  test "dishes index should be shown correclty" do
    visit dishes_path
    page.must_have_css 'ul.dishes'
  end
  
  
 
end
