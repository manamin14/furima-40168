class Item < ApplicationRecord
  validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, format: { with: /\A[3-9]\d{2,6}\z/, message: "は¥300以上¥9,999,999以下で入力してください" }
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :detail_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :shipping_detail_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :shipping_day_id, numericality:{ other_than: 1, message: "can't be blank"}

  has_one_attached :image
  belongs_to :category
  belongs_to :detail
  belongs_to :shipping_detail
  belongs_to :prefecture
  belongs_to :shipping_day

end
