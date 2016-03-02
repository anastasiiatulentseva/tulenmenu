require "test_helper"

class DishDeleteTest < InteractiveTest
  
  def setup
    @user = users(:john)
    super
    @delete_dish = dishes(:delete_dish)
  end
  
  test "deleting dishes" do
    login_as_user(@user)
    
    visit dishes_path
    within("td div#dish-#{@delete_dish.id}") do
      find_link('×').click
    end

    page.must_have_css 'div.alert-success'
    page.wont_have_css @delete_dish.name
  end

  
end 