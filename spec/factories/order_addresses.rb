FactoryBot.define do
 factory :order_address do
 postal_code { '123-4567' }
 prefecture_id { 2 }
 city_name { '港区' }
 street_address { '横浜1-1' }
 building_name { '' }
 phone_number { '08055557777' }
 association :user, :item
  end
end
