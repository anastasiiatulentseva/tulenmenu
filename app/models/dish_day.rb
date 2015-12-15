class DishDay < ActiveRecord::Base
  
  belongs_to :dish
  validates :dish_id, presence: true
  validates :day, presence: true
  validate :not_have_passed, if: :day?
  
  scope :dish_of_the_day, -> {where(day: Date.today, dish_of_the_day: true)}
  
  private
  
  def not_have_passed
    if day < Date.today
      errors.add(:day, "can't be in the past")
    end
  end
  
end

