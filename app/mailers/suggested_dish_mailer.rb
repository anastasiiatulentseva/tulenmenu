class SuggestedDishMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.suggested_dish_mailer.new_suggested_dish.subject
  #
  def new_suggested_dish(suggested_dish)
    @suggested_dish = suggested_dish
    mail to: "nastena-skid@yandex.ru", subject: "New suggested dish!"
  end
end
