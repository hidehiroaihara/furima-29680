FactoryBot.define do
  factory :product do
    name                       { '可愛いワンチャン' }
    content                    { Faker::Lorem.sentence }
    category_id                {rand (2..11) }
    products_condition_id      {rand (2..7) }
    shipping_id                {rand (2..48) }
    delivery_fee_id            {rand (2..3) }
    delivery_day_id            {rand (2..4) }
    price                      {rand (300..9999999) }
    association :user

  end
end
