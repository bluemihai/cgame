FactoryGirl.define do
  factory :container do
    name "MyString"
    starting "2017-03-05 17:00:00"
    weeks 6
    association :location
    association :host, factory: :user
  end
end
