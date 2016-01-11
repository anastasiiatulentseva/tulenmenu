require "test_helper"

class SuggestedDishEditTest < InteractiveTest
  
  def setup
    @pizza = suggested_dishes(:pizza)
    @name = @pizza.name
    @comment = @pizza.comment
  end
  
  test "usuccessful edit" do
    visit suggested_dishes_path
    click_link(@pizza.name)
    page.must_have_css 'form.edit_suggested_dish'
    fill_in('suggested_dish[name]', :with => '')
    fill_in('suggested_dish[comment]', :with => 'p')
    click_button('Save')
    page.must_have_css 'div#error_explanation'
    @pizza.reload
    assert_equal @name, @pizza.name
    assert_equal @comment, @pizza.comment
  end
  
  test "successful edit" do
    visit edit_suggested_dish_path(@pizza.id)
    fill_in('suggested_dish[comment]', with: "edited comment")
    click_button('Save')
    page.must_have_css 'div.alert-success'
    page.must_have_css 'ul#suggested_dishes'
    @pizza.reload
    page.must_have_content @pizza.comment
  end
  
  
  
  
end
