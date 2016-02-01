require 'test_helper'

class HomePageTest < InteractiveTest

  def setup
    @dish = dishes(:borsch)
  end

  test "should show dish of the day" do
    visit root_path
    page.must_have_css 'h3.alert-info'

    visit new_dish_day_path
    select Date.today.year, :from => "dish_day[day(1i)]"
    select Date::MONTHNAMES[Date.today.month], :from => 'dish_day[day(2i)]'
    select Date.today.day, :from => "dish_day[day(3i)]"
    select "borsch", :from => "dish_day[dish_id]"
    
    find('#dish_day_dish_of_the_day').set(true)
    click_button 'Save'

    assert_not_equal DishDay.dish_of_the_day.first, nil 
    
    visit root_path
    page.must_have_css 'div#dish_of_the_day'

    page.must_have_content @dish.name
  end

  test "should render a modal with suggest dish dialog" do
    visit root_path

    page.must_have_css 'div.col-md-3'
    page.must_have_css 'input.btn'
    click_button('Do it!')
    page.must_have_css 'div.modal'

  end
end
