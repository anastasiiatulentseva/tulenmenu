require 'test_helper'

class WeekPlansControllerTest < ActionController::TestCase
 
  def setup
    @basetitle = "Menu Tulentsevyh"
  end  
 
  test "should get index" do
    get :index
    assert_response :success
    assert_select "title",  "Week plan | #{@basetitle}"
  end
 
end
