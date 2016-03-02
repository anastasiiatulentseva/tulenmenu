require 'rails_helper'

RSpec.feature "Dish management" do
  fixtures :users
  let(:user) { users(:john) }

  scenario "User creates a new dish" do
    login_as(user)

    visit new_dish_path
    expect(page).to have_css 'div.form-group'
    fill_in 'dish[name]', :with => ''
    click_button 'Save'
    expect(page).to have_text('The form contains')

    fill_in 'dish[name]', :with => 'new dish'
    attach_file('dish[picture]', Rails.root.join('spec/fixtures/b.jpg'))

    click_button 'Save'
    expect(page).to have_text('Dish has been created')

    visit dishes_path
    expect(page).to have_text('new dish')
  end
end
