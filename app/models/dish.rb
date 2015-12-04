class Dish < ActiveRecord::Base
  
  has_many :dish_days
  validates :name, presence: true, length: {in: 3..50}
  validate :picture_size
  mount_uploader :picture, PictureUploader
  
  private
  
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
  
end
