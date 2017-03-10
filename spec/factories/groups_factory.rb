FactoryGirl.define do
  factory :group do
    association :round, factory: :round
    association :activity, factory: :activity
    activity_id 1
    wild_card false
    wc_interpretation "MyString"
    wc_curation "MyString"
  end
end
