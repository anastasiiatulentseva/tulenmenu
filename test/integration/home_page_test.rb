require 'test_helper'

class HomePageTest < ActionDispatch::IntegrationTest
  
  def setup
    @dish = dishes(:borsch)
  end
  
  test "should show dish of the day" do
    get root_path
    assert_template 'static_pages/home'
    assert_select 'h3.alert-info'
    
    get new_dish_day_path
    post dish_days_path, dish_day: { dish_id: @dish.id, day: Date.today, dish_of_the_day: true }
    
    get root_path
    assert_select 'div#dish_of_the_day'
    
    assert_match @dish.name.to_s, response.body
  end
  
  
end
