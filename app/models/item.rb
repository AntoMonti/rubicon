class Item < ApplicationRecord
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :name, :description, presence: true

  has_and_belongs_to_many :carts
  has_many :positions
end
