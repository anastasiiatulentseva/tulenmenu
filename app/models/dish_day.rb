class DishDay < ActiveRecord::Base
  
  belongs_to :dish
  validates :dish_id, presence: true
  validates :day, presence: true
  validate :not_have_passed, if: :day?
  
    
  
  private
  
  def not_have_passed
    if day < Date.today
      errors.add(:day, "can't be in the past")
    end
  end
  
end
