# Preview all emails at http://localhost:3000/rails/mailers/suggested_dish_mailer
class SuggestedDishMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/suggested_dish_mailer/new_suggested_dish
  def new_suggested_dish
    suggested_dish = SuggestedDish.last
    SuggestedDishMailer.new_suggested_dish(suggested_dish)
  end

end
