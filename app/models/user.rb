class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: :true
  has_many :items
  has_many :purchases
  has_many :reviews
  # mount_uploader :photo, PhotoUploader
end
