class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  has_many :items
  has_many :purchases
  has_many :reviews
  has_many :sender_chatrooms, foreign_key: "sender_chatrooms", class_name: "Chatroom"
  has_many :receiver_chatrooms, foreign_key: "receiver_chatrooms", class_name: "Chatroom"
  mount_uploader :photo, PhotoUploader
end
