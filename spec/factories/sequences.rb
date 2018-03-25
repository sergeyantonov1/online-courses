FactoryGirl.define do
  sequence(:email) { Faker::Internet.email }
  sequence(:title) { |n| "#{Faker::Lorem.words} #{n}" }
  sequence(:first_name) { Faker::Name.name }
  sequence(:second_name) { Faker::Name.last_name }
end
