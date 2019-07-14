FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '12345667' }
  end
end

FactoryBot.define do
    factory :post do
      title { Faker::Lorem.word }
      source { Faker::Lorem.word }
      link { Faker::Lorem.word }
      association :user
    end
end