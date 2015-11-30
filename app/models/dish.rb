class Dish < ActiveRecord::Base
  
  validates :name, presence: true, length: {in: 3..50}
  
  
end
