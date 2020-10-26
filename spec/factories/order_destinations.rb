FactoryBot.define do
  factory :order_destination do
    postal_code {'000-0000'}
    prefecture_id { 2 }
    municipality {'市町村のテスト'}
    address {'地名のテスト'}
    building_name {'建物のテスト'}
    phone_number {'09012345678'}
    user_id { 1 }
    item_id { 2 }
    token {'00000000000000000'}
  end
end
