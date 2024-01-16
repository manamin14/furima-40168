class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :datail
  belongs_to :shipping_detail
  belongs_to :prefecture
  belongs_to :shippng_day

  validates :category_id, numericality: { other_than: 1 } 
  validates :detail_id, numericality: { other_than: 1 }
  validates :shipping_detail_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shippng_day_id, numericality: { other_than: 1 }
end
