require 'factory_girl_rails'

FactoryGirl.create(:user, email: "user@example.com")
FactoryGirl.create(:manager, email: "super_manager@example.com", super_manager: true)
FactoryGirl.create(:manager, email: "manager@example.com")
