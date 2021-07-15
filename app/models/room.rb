class Room < ApplicationRecord
  mount_uploader :room_image, RoomImageUploader
  
  belongs_to :user
  has_many :reserves
end
