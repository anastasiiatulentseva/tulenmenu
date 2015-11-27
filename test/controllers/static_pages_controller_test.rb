require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  
  def setup
    @basetitle = "Menu Tulentsevyh"
  end
  
  
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | #{@basetitle}"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | #{@basetitle}"
  end

end
