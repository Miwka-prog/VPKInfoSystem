FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    first_name { Faker::Name.name }
    last_name { Faker::Name.last_name }
  end
end
