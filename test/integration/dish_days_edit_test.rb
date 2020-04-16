require "test_helper"

class DishDaysEditTest < InteractiveTest
  
  def setup
    @user = users(:john)
    super
    @edit_dish = dishes(:edit_dish_for_dish_day)
    @delete_dish = dishes(:delete_dish_for_dish_day2)
  end
  
  test 'should edit and redirect back' do
    login_as_user(@user)
    
    visit new_dish_day_path
    select Date.today.end_of_week.year, :from => "dish_day[day(1i)]"
    select Date::MONTHNAMES[Date.today.end_of_week.month], :from => 'dish_day[day(2i)]'
    select Date.today.end_of_week.day, :from => "dish_day[day(3i)]"
    select @edit_dish.name, :from => "dish_day[dish_id]"
    click_button('Save')    
    
    visit week_plans_path

    page.must_have_css 'ul.list-group'
    within "li#dish-day-#{Date.today.end_of_week.strftime('%F')}" do
      find_link(@edit_dish.name).click
    end
    page.must_have_css 'form.form-horizontal'
    select Date.today.beginning_of_week.year, :from => "dish_day[day(1i)]"
    select Date::MONTHNAMES[Date.today.beginning_of_week.month], :from => 'dish_day[day(2i)]'
    select Date.today.beginning_of_week.day, :from => "dish_day[day(3i)]"
    select @edit_dish.name, :from => "dish_day[dish_id]"
    check 'dish_day[dish_of_the_day]'
    click_button('Save')
    
    page.must_have_css 'div.alert-success'
    within "ul#dish-day-#{Date.today.beginning_of_week.strftime('%F')} li#week-plan-dish-#{@edit_dish.id}" do
      find_link(@edit_dish.name)
    end
  end
  
  test "should delete menu item" do
    login_as_user(@user)
    
    visit new_dish_day_path
    select Date.today.end_of_week.year, :from => "dish_day[day(1i)]"
    select Date::MONTHNAMES[Date.today.end_of_week.month], :from => 'dish_day[day(2i)]'
    select Date.today.end_of_week.day, :from => "dish_day[day(3i)]"
    select @delete_dish.name, :from => "dish_day[dish_id]"
    click_button('Save')
    
    visit week_plans_path
    within "ul#dish-day-#{Date.today.end_of_week.strftime('%F')} li#week-plan-dish-#{@delete_dish.id}" do
        click_link('×')
    end
    page.must_have_css 'div.alert-success'
    page.wont_have_content @delete_dish.name
  end
  
end
