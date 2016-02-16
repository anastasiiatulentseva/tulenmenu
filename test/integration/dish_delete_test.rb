require "test_helper"

class DishDeleteTest < InteractiveTest
  
  def setup
    @pancakes = dishes(:pancakes)
  end
  
  test "deleting dishes" do
    visit dishes_path
    within("td div#dish-#{@pancakes.id}") do
      find_link('×').click
    end
    page.must_have_css 'div.alert-success'
    page.wont_have_css @pancakes.name
  end
  
  
end
