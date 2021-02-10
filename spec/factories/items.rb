FactoryBot.define do
  factory :item do
    name               {Faker::Name.initials(number: 2)} 
    text               {Faker::Lorem.sentence }
    category_id        { 3 }
    state_id           { 3 }
    postage_id         { 3 }
    region_id          { 3 }
    shipping_date_id   { 3 }
    price              { 300 }
  end
end
