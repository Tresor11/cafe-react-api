FactoryBot.define do
  factory :item do
    name { Faker::Lorem.word }
    category { Faker::Lorem.word }
    price { 20 }
  end
end
