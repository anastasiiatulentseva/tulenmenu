require 'test_helper'

class HomePageTest < InteractiveTest
  
  test "layout links" do
    visit root_path
    
    page.must_have_css "a[href$='#{root_path}']"
    page.must_have_css "a[href$='#{about_path}']"
    page.must_have_css "a[href$='#{today_menus_path}']"
    page.must_have_css "a[href$='#{week_plans_path}']"
  end
  
  
end
