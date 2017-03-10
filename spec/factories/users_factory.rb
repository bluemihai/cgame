FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.safe_email }

    trait :admin do
      role 'admin'
    end

  end
end
