require "test_helper"

class SuggestedDishMailerTest < ActionMailer::TestCase
  
  def test_new_suggested_dish
    @suggested_dish = suggested_dishes(:pizza)
    mail = SuggestedDishMailer.new_suggested_dish(@suggested_dish)
    assert_equal "New suggested dish!", mail.subject
    assert_equal ["nastena-skid@yandex.ru"], mail.to
    assert_equal ["noreply@tulenmenu.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
