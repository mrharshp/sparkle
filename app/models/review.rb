class Review < ApplicationRecord
  belongs_to :item
  validates :content, presence: true
end
