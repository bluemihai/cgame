FactoryGirl.define do
  factory :offering do
    name "MyString"
    description "MyText"
    presenter "MyString"
    price_min 1
    price_ideal 1
    hours_min 1
    hours_ideal 1
    other_logistics "MyText"
    presenter_bio "MyText"
    creator_id 1
  end
end
