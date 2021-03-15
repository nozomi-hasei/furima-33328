FactoryBot.define do
  factory :product do
    product_name            {Faker::name}
    description             {Faker::Lorem.sentence}
    category_id             {'1'}
    condition_id            {'2'}
    delivery_cost_id        {'1'}
    delivery_prefecture_id  {'2'}
    delivery_day_id         {'1'}
    price                   {'32000'}

    after(:build) do |Product|
      product.image.attach(io: File.open('public/images/test.png')), filename: 'test.pmg')
    end
  end
end
