FactoryBot.define do
  factory :product do
    product_name            {Faker::Name.initials}
    description             {Faker::Lorem.sentence}
    category_id             {2}
    condition_id            {2}
    delivery_cost_id        {2}
    delivery_prefecture_id  {2}
    delivery_day_id         {2}
    price                   {32000}
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test.png'), filename: 'test.pmg')
    end
  end
end
