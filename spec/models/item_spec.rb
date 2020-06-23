require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'validate strong params' do
    should validate_presence_of(:name)
    should validate_presence_of(:price)
    should validate_presence_of(:weight)
    should validate_presence_of(:description)
  end

  it 'validate models attributes' do
    should validate_numericality_of(:price).
      is_greater_than_or_equal_to(0)
  end

  it 'validate relations' do
    should have_many(:positions)
    should have_many(:carts).through(:positions)
    should have_many(:comments)
    should have_one(:image)
  end

  let!(:item) { create :item }
  let!(:item) { create :item }
  let!(:order) { create :order }

  it 'factory implement: calculates the total price' do
    order.items << item
    order.items << item
    expect(order.calculate_total).to be 82000.0
  end
end
