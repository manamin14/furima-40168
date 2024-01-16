class Item < ApplicationRecord
  validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
  
  has_one_attached :image
end
