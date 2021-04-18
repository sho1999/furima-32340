FactoryBot.define do
  factory :item do
    name               {Faker::Name.initials(number: 3)}
    description        {Faker::Lorem.paragraph}
    price              {Faker::Number.within(range: 300..9999999)}
    category_id        {Faker::Number.within(range: 2..11)}
    state_id           {Faker::Number.within(range: 2..7)}
    delivery_fee_id    {Faker::Number.within(range: 2..3)}
    region_id          {Faker::Number.within(range: 1..47)}
    shipping_date_id   {Faker::Number.within(range: 2..4)}    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end