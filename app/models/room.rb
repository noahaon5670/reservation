class Room < ApplicationRecord
  mount_uploader :room_image, RoomImageUploader
  
  belongs_to :user
  has_many :reserves
    
  validates :name, presence: true, length: {in: 2..50}
  validates :explanation, presence: true
  validates :fee, presence: true, :numericality => {:greater_than_or_equal_to => 0}
  validates :address, presence: true
  validates :room_image, presence: true
  
end
