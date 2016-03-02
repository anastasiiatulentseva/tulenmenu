require 'test_helper'

class SiteLayoutTest < InteractiveTest
  
  def setup
    @user = users(:john)
    super
  end
  
  test "should show correct list of links for guests" do
    visit root_path
    page.must_have_css 'a#sign-up'
    page.must_have_css 'a#sign-in'
    page.must_have_content 'Welcome'
    
    page.wont_have_css "a[href$='#{today_menus_path}']"
  end
  
  test "layout links" do
    login_as_user(@user)
       
    visit root_path
    
    page.must_have_css "a[href$='#{root_path}']"
    page.must_have_css "a[href$='#{about_path}']"
    page.must_have_css "a[href$='#{today_menus_path}']"
    page.must_have_css "a[href$='#{week_plans_path}']"
  end
  
  
end
