FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.initials(number: 3)}
    email                  {Faker::Internet.free_email}
    password               {Faker::Internet.password(min_length: 6)}
    password_confirmaiton  {password}
    
      transient do
        person { Gimei.name }
      end
      last_name { person.last.kanji }
      first_name { person.first.kanji }
      last_name_kana { person.last.hiragana }
      first_name_kana { person.first.hiragana }
  end
end