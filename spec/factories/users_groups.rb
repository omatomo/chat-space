FactoryGirl.define do
  factory :user_group do
    user_id            {Faker::Number.number(1)}
    group_id           {Faker::Number.number(2)}
  end
end