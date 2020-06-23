FactoryBot.define do
  factory :item do
    name        { 'Subaru' }
    price       { 41000 }
    real        { true }
    weight      { 1700 }
    description { 'It`s japanese car'}
  end
end