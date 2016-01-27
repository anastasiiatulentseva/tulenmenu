require 'test_helper'

class SuggestedDishesControllerTest < ActionController::TestCase
  
  test "should get index" do
    get :index
    assert_response :success
    assert_select "title",  "Suggested dish list | Menu Tulentsevyh"
  end
  
  test "should save correct suggested dish" do
    assert_difference 'SuggestedDish.count', 1 do
      xhr :post, :create, suggested_dish: { name: "dish", comment: "hey hey" }
    end
  end
  
  test "should render new for wrong suggested dish" do
    assert_no_difference 'SuggestedDish.count' do
      xhr :post, :create, suggested_dish: { name: "d" }
    end
  end
  
  
  
  
  
end
