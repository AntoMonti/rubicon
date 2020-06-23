FactoryBot.define do
  factory :item do
    name        { Faker::Vehicle.make_and_model }
    price       { rand 12000...55000 }
    real        { true }
    weight      { rand 1500...3400 }
    description { Faker::Vehicle.car_options }
  end
end