class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  #has_one :order
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_cost
  belongs_to_active_hash :delivery_prefecture
  belongs_to_active_hash :delivery_day
  
  with_options presence: true do
    validates :product_name, :description, :image

    with_options format: {with: /\A[0-9]+\Z/} do
      validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}, presence: {message: "can't be blank"}
    end
  
    with_options numericality: { other_than: 1 } do
      validates :category_id, :condition_id, :delivery_cost_id, :delivery_prefecture_id, :delivery_day_id
    end
  end
end
