class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_one :Address
end
