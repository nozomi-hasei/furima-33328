class Product < ApplicationRecord

  validates :Product_name,             presence: true
  validates :description,              presence: true
  validates :category_id,              presence: true
  validates :condition_id,             presence: true
  validates :delivery_cost_id,         presence: true
  validates :delivery_prefectures_id,  presence: true
  validates :delivery_day_id,          presence: true
  with_options presence: true, format: {with: /\A[0-9]+\Z/} do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}, presence: {message: "can't be blank"}
  end


  belongs_to :user
  #has_one :order
  has_one_attached :image
end
