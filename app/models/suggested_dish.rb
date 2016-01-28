class SuggestedDish < ActiveRecord::Base
  
  validates :name, presence: true, length: {in: 3..50}
  validates :comment, presence: true, length: {in: 3..250}
  
end