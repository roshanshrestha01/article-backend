FactoryBot.define do
    factory :comment do
      message { Faker::Lorem.word }
      association :user
      association :post
    end
  end