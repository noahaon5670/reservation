class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  mount_uploader :icon, IconUploader
  
  has_many :rooms
  has_many :reserves
  
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 100 }
  validates :encrypted_password, presence: true
  validates :icon, presence: true
  validates :profile, presence: true

end
