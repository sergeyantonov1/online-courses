FactoryGirl.define do
  factory :user do
    email
    first_name { Faker::Name.name }
    second_name { Faker::Name.last_name }
    password "password"
    password_confirmation { password }
    confirmed_at 1.hour.ago
  end

  trait :not_confirmed do
    confirmed_at nil

    after(:create) do |user|
      user.update(confirmation_sent_at: 3.days.ago)
    end
  end
end
