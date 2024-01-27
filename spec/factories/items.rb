FactoryBot.define do
  factory :item do
  title         { 'Sample Item' }
  description   { 'This is a sample item.' }
  detail_id { 2 }
  category_id { 2 }
  shipping_detail_id { 2 }
  shipping_day_id { 2 }
  prefecture_id { 2 }
  price { 500 }

  association :user

  after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
  end
end