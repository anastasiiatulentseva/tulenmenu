require 'test_helper'

class AddDishTest < InteractiveTest

  def setup
    @dish = dishes(:borsch)
    @dish_count = Dish.count
    @picture_url = 'http://www.ikea.com/us/en/images/products/smarta-oven-serving-dish-white__0091501_PE227207_S4.JPG'
    @picture_name = 'smarta-oven-serving-dish-white__0091501_PE227207_S4.JPG'
  end
  
  test "should add new dish" do
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
  
  test "should show image preview when pasting picture url" do
    Capybara.current_driver = :selenium
    
    visit new_dish_path
    fill_in('dish[name]', :with => 'new_dish')
    fill_in('dish[remote_picture_url]', :with => @picture_url)
    page.execute_script("$('#dish_remote_picture_url').trigger('paste')")
    page.must_have_css("img[src='#{@picture_url}']")
    click_button('Save')
    visit dishes_path
    page.must_have_css("img[src='/uploads/dish/picture/#{Dish.order(:id).last.id}/#{@picture_name}']")
  end
  
  
end







