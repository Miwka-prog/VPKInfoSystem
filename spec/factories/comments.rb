FactoryBot.define do
  factory :comment do
    association :user
    association :news
    content { Faker::TvShows::FinalSpace.quote }
  end
end
