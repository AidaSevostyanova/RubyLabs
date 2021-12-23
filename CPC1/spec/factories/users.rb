FactoryBot.define do
  factory :user do
    first_name { FFaker::Name.name }
    last_name { FFaker::Internet.name }
    email { FFaker::Internet.email }
  end
end
