FactoryBot.define do
  factory :product_order do
    postal_code              {'123-1234'}
    delivery_prefecture_id   {'5'}
    city                     {'世田谷区'}
    address1                 {'13-2-2'}
    address2                 {'エレファントビル'}
    phone_number             {'09055552222'}
  end
end