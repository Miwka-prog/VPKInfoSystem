FactoryBot.define do
  factory :news do
    content { Faker::Lorem.sentence }
    title { Faker::Lorem.word }

    association :user
  end
end
