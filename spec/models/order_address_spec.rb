require 'rails_helper'

describe '購入情報の保存' do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  context '商品が正常に購入できる場合' do
    it 'postal_code、prefecture_id、city_name、street_address、phone_numberが入力されていれば保存できる' do
      expect(@order_address).to be_valid
    end
    it 'building_nameは空でも保存できること' do
      @order_address.building_name = ''
      expect(@order_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'postal_codeが空だと保存できないこと' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.postal_code = 1234567
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code は無効な形式です。例: 123-4567")
    end
    it 'prefecture_idが1では保存できないこと' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")

    end
    it 'city_nameが空だと保存できないこと' do
      @order_address.city_name = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City name can't be blank")
    end
    it 'street_addressが空では保存できないこと' do
      @order_address.street_address = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Street address can't be blank")
    end
    it 'phone_numberが空では保存できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが10桁以上出ないと保存できない' do
      @order_address.phone_number = 123456789
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number は無効な形式です。10桁または11桁の半角数値を入力してください。")
    end
    it 'phone_numberが11桁以内でないと保存できない'do
      @order_address.phone_number = 123456789999
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number は無効な形式です。10桁または11桁の半角数値を入力してください。")
    end
    it 'phone_numberが半角数値でないと保存できない'do
      @order_address.phone_number = '123-3333-6789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number は無効な形式です。10桁または11桁の半角数値を入力してください。")
    end
  end
end