class SuggestedDish < ApplicationRecord

  validates :name, presence: true, length: {in: 3..50}
  validates :comment, presence: true, length: {in: 3..250}
  default_scope {order('created_at DESC')}

end
