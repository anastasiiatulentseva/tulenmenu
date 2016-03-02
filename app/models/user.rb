class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, length: {in: 3..50}, allow_nil: true
  
  validate :picture_size
  mount_uploader :picture, PictureUploader

  private

  def picture_size
    if picture.size > 5.megabytes
     errors.add(:picture, "should be less than 5MB")
    end
  end

  
end
