FactoryBot.define do
  factory :lab do
    association :user

    title { FFaker::Book.title }
    description { FFaker::Lorem.sentence }
  end
end
