FactoryBot.define do
  factory :item do
    name { "名前のテスト"}
    price { "999999" }
    describe { "説明のテスト" }
    user_id { "1" }
    category_id {"2"}
    condition_id {"2"}
    shipping_cost_payer_id {"2"}
    prefecture_id {"2"}
    shipping_day_id {"2"}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
