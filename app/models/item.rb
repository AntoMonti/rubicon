class Item < ApplicationRecord
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :name, :price, :weight, :description, presence: true

  has_many :positions
  has_many :carts, through: :positions
  has_many :comments, as: :commentable 
  has_one :image, as: :imageable
  has_and_belongs_to_many :orders
end
