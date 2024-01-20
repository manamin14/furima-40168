require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品を出品できる場合' do
      it 'title、description、category_id、detail_id、shipping_detail_id、shipping_day_id、prefecture_id、price、imageが存在すれば出品
      できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it '商品画像が添付されていないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では保存できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品の説明が空では保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーの選択が1の場合は保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が1では保存できない' do
        @item.detail_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it '配送料の負担が1だと保存できない' do
        @item.shipping_detail_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping detail can't be blank")
      end
      it '発送元の情報が1だと保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が1では保存できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it '価格が空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が¥300以下は保存できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300以上¥9,999,999以下で入力してください")
      end
      it '価格は半角数値以外保存できない' do
        @item.price = '５６７'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300以上¥9,999,999以下で入力してください")
      end
      it '価格が¥9,999,999以上は保存できない' do
        @item.price ='10,000,000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300以上¥9,999,999以下で入力してください")
      end
  end
end
end