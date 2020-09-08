FactoryBot.define do
  factory :product do
    name                       { '可愛いワンチャン' }
    content                    { Faker::Lorem.sentence }
    category_id                {rand (1..11) }
    products_condition_id      {rand (1..7) }
    shipping_id                {rand (1..48) }
    delivery_fee_id            {rand (1..4) }
    delivery_day_id            {rand (1..4) }
    price                      {rand (300..9999999) }
  end
end
