FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 3)}
    email                 {Faker::Internet.free_email}
    password              {'sho123'}
    password_confirmation {password}
    transient do
      person { Gimei.name }
    end
    last_name             {person.last.kanji}
    first_name            {person.first.kanji}
    last_name_kana        {person.last.katakana}
    first_name_kana       {person.first.katakana}
    birthday              { Faker::Date.backward}
  end
end