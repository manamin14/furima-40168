class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city_name, :street_address, :building_name, :phone_number, :order_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "は無効な形式です。例: 123-4567" }
    validates :prefecture_id,numericality: { other_than: 1, message: "can't be blank"}
    validates :city_name, presence: true
    validates :street_address, presence: true
    validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "は無効な形式です。10桁または11桁の半角数値を入力してください。" }
    validates :token, presence: true
end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
   Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city_name: city_name, street_address: street_address, building_name: building_name, phone_number: phone_number, order: order)
  end
end