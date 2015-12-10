require 'test_helper'

class DishesControllerTest < ActionController::TestCase
  
  def setup
    @basetitle = "Menu Tulentsevyh"
  end  
  
  test "should get index" do
    get :index
    assert_response :success
    assert_select "title",  "Dish list | #{@basetitle}"
  end
  
  test "should redirect new for correct dish" do
    assert_difference 'Dish.count', 1 do
      post :create, dish: { name: "dish" }
    end
    assert_redirected_to new_dish_url
  end
  
  test "should render new for wrong dish" do
    assert_no_difference 'Dish.count' do
      post :create, dish: { name: "d" }
    end
    assert_template 'dishes/new'
  end
  
  
end
