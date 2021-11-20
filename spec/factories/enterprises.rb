FactoryBot.define do
  factory :enterprise do
    description { Faker::Lorem.sentence }
    headquaters { Faker::Address.country }
    title { Faker::Lorem.word }
    association :user
  end
end
