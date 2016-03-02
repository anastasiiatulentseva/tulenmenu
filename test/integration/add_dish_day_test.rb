require 'test_helper'

class AddDishDayTest < InteractiveTest
  
  def setup
    @user = users(:john)
    super
    @dish = dishes(:soup)
    @another_dish = dishes(:pancakes)
    @dish_day_count = DishDay.count
    @dish_of_the_day_count = DishDay.dish_of_the_day.count
  end
  
  test "Add new dish_day" do
    login_as_user(@user)
    
    visit new_dish_day_path
    page.must_have_css 'form.form-horizontal'
    
    #Invalid submission   
    select "2014", :from => "dish_day[day(1i)]"
    select @dish.name, :from => "dish_day[dish_id]"
    click_button('Save')
    assert_equal @dish_day_count, DishDay.count
    page.must_have_css 'div#error_explanation'
    
    #Valid submission
    select Date.today.end_of_week.year, :from => "dish_day[day(1i)]"
    select Date::MONTHNAMES[Date.today.end_of_week.month], :from => 'dish_day[day(2i)]'
    select Date.today.end_of_week.day, :from => "dish_day[day(3i)]"
    select @another_dish.name, :from => "dish_day[dish_id]"
    click_button('Save')    
    assert_equal @dish_day_count + 1, DishDay.count
    page.must_have_css 'div.alert-success'
  end
    
  test "check-box should set dish of the day to true" do
    login_as_user(@user)
    
    visit new_dish_day_path
    select Date.today.year, :from => "dish_day[day(1i)]"
    select Date::MONTHNAMES[Date.today.month], :from => 'dish_day[day(2i)]'
    select Date.today.day, :from => "dish_day[day(3i)]"
    select @dish.name, :from => "dish_day[dish_id]"
    check('dish_day[dish_of_the_day]')
    click_button('Save')
    assert_equal @dish_of_the_day_count + 1, DishDay.dish_of_the_day.count
  end
  
  
  
end








