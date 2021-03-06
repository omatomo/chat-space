FactoryGirl.define do

  factory :group do
    group_name {Faker::Name.name}
    id {Faker::Number.digit}
    created_at { Faker::Time.between(5.days.ago, 3.days.ago, :all) }
    updated_at { Faker::Time.between(2.days.ago, 1.days.ago, :all) }
    user_ids  [1]
  end
end