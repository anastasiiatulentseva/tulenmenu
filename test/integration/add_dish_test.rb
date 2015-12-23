require 'test_helper'

class AddDishTest < InteractiveTest

  def setup
    @dish = dishes(:borsch)
    @dish_count = Dish.count
  end
  
  test "Add new dish" do
    visit new_dish_path
    page.must_have_css 'div.form-group'
    
    #Invalid submission
    fill_in('dish[name]', :with => '')
    click_button('Save')
    assert_equal @dish_count, Dish.count
    page.must_have_css 'div#error_explanation'
    
    #Valid submission
    fill_in('dish[name]', :with => @dish.name)
    attach_file('dish[picture]', Rails.root.join('test/fixtures/b.jpg'))
    click_button('Save')
    assert_equal @dish_count + 1, Dish.count
    page.must_have_css 'div.alert-success'
    page.has_content?('Dish has been created successfully')
    page.current_path == new_dish_path
    visit dishes_path
    page.has_content?(@dish.name)
    page.has_content?(@dish.picture.to_s)
   
  end
  
end
