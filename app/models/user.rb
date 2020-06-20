class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  has_many :order, dependent: :destroy
end
