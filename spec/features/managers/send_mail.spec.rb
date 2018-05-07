require "rails_helper"

feature "Send mail" do
  let!(:user) { create :user }
  let!(:teacher) { create :teacher }
  let!(:manager) { create :manager }

  context "Mail user" do
    include_context "current manager signed in"

    scenario "Send correct mail" do
      visit new_managers_conversation_path

      select "user", from: :profile_role
      select user.first_name, from: :profile_id
      fill_in :subject, with: "Hello"
      fill_in :body, with: "You are a great user"

      click_on "Send"
      #TODO: finish specs
    end
  end
end
