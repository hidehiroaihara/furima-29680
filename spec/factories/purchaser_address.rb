FactoryBot.define do
  factory :purchaser_address do
    post_code         { '123-4567' }
    prefecture_id     {rand (2..48) }
    city              { '埼玉県' }
    house_number      { '所沢市１−３−４' }
    phone_number      {'09012345678'}

  end
end