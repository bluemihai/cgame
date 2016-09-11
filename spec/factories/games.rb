FactoryGirl.define do
  factory :game do
    association :location, factory: :location
    association :host, factory: :user
    starting "2016-08-29 10:53:52"
    ending "2016-08-29 10:53:52"
    location_id 1
    host_id 1
    facebook_event_url "MyString"
    review "MyText"
  end
end
