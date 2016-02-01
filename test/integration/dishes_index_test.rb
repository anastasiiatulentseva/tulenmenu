require 'test_helper'

class DishesIndexTest < InteractiveTest
  
  test "dishes index should be shown correclty" do
    visit dishes_path
    page.must_have_css 'table.borderless'
    within(:css, 'table') do
      first('td span').must_have_content(Dish.order(:updated_at).first.name)
    end
  end
  
 
end
