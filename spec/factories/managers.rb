FactoryGirl.define do
  factory :manager do
    first_name
    second_name
    email
    password "password"
  end

  trait :with_super do
    after(:create) do |manager|
      manager.update(super_manager: true)
    end
  end
end
