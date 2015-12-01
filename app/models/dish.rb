class Dish < ActiveRecord::Base
  
  validates :name, presence: true, length: {in: 3..50}
  mount_uploader :picture, PictureUploader
  validate :picture_size
  
  
  private
  
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
  
end
