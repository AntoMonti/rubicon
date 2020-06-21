class Cart < ApplicationRecord
  belongs_to :user, optional: true
  
  has_ many :positions
  has_many :items, through: :positions
end
