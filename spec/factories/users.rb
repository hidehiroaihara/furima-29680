FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.initials(number: 3)}
    email                  {Faker::Internet.free_email}
    password               {Faker::Internet.password(min_length: 6)}
    password_confirmaiton  {password}
    family_name            { '田中' }
    first_name             { '清隆' }
    family_name_cana       { 'タナカ' }
    first_name_kana        { 'キヨタカ' }
    birthday               {Faker::Date.birthday(min_age: 5, max_age: 90)}
  end
end