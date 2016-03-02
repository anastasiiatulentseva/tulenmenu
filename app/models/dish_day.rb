class DishDay < ApplicationRecord

  belongs_to :dish

  validates :day, :dish, presence: true
  validate :not_have_passed, if: :day?, on: :create

  scope :dish_of_the_day, -> { where(day: Date.today, dish_of_the_day: true) }

  private

  def not_have_passed
    if day < Date.today
      errors.add(:day, "can't be in the past")
    end
  end
end

