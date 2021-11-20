FactoryBot.define do
  factory :product do
    content { Faker::Lorem.word }

    association :enterprise
  end
end
