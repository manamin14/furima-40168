class Item < ApplicationRecord
  validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, format: { with: /\A[3-9]\d{2,6}\z/, message: "は¥300以上¥9,999,999以下で入力してください" }

  has_one_attached :image
end
