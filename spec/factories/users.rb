FactoryGirl.define do
	factory :user do
		id                    {Faker::Number.digit}
		name                  "fack"
		email                 "aaaa@aaaa.a"
		password              "00000000"
		password_confirmation "00000000"
	end
end