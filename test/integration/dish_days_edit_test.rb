require "test_helper"

class DishDaysEditTest < InteractiveTest
  
  def setup
    @edit_dish = dishes(:edit_dish)
    @delete_dish = dishes(:delete_dish)
  end
  
  test 'should edit and redirect back' do
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
    within "li#dish-day-#{Date.today.beginning_of_week.strftime('%F')}" do
      find_link(@edit_dish.name)
    end
  end
  
  test "should delete menu item" do
    visit new_dish_day_path
    select Date.today.end_of_week.year, :from => "dish_day[day(1i)]"
    select Date::MONTHNAMES[Date.today.end_of_week.month], :from => 'dish_day[day(2i)]'
    select Date.today.end_of_week.day, :from => "dish_day[day(3i)]"
    select @delete_dish.name, :from => "dish_day[dish_id]"
    click_button('Save')
    
    visit week_plans_path
    within "li#dish-day-#{Date.today.end_of_week.strftime('%F')}" do
      find_link('×').click
    end
    page.must_have_css 'div.alert-success'
    page.wont_have_content @delete_dish.name
    
  end
  
end
