class OrderAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :prefecture_id, :city_name, :street_address, :building_name, :phone_number, :order

  with_options presence: true do
    validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "は無効な形式です。例: 123-4567" }
    validates :prefecture_id,numericality: { other_than: 1, message: "can't be blank"}
    validates :city_name, presence: true
    validates :street_address, presence: true
    validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "は無効な形式です。10桁または11桁の半角数値を入力してください。" }
end
end