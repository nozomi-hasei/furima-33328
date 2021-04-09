class ProductOrderinclude 
  ActiveModel::module 
  attr_accessor :token, :postal_code, :delivery_prefecture_id, :city, :address1, :address2, :phone_number, :product_id, :user_id

  with options presense: true do
    validates :token, :city, :address1
    validates :delivery_prefecture_id, :numercality: { other_than: 1 }
    validates :phone_number, format: { with: /\A\d{11}}\Z/ }

    with options format: { with: /\A\d{3}[-]\d{4}\Z/ } do
      validates :postal_code, length: { is: 8 } 
    end
  end

  def save
    Addresses.create(postal_code: postal_code, delivery_prefecture_id: delivery_prefecture_id, city: city, address1: address1, address2: address2, phone_number: phone_number)
    Product.create(user_id: user_id, product_id: product_id)
  end
end


