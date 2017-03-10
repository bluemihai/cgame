FactoryGirl.define do
  factory :round do
    association :game, factory: :game
    order 1
    method_split "MyString"
  end
end
