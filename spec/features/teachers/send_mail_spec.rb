require "rails_helper"

feature "Send mail" do
  let!(:user) { create :user }
  let!(:teacher) { create :teacher }
  let!(:manager) { create :manager }
  let(:message) { "Hello there" }
  let(:subject) { "Hello" }

  context "Mail user" do
    include_context "current teacher signed in"

    scenario "Send correct mail" do
      visit new_teachers_conversation_path

      select "user", from: :profile_role
      select user.first_name, from: :profile_id
      fill_in :subject, with: subject
      fill_in :body, with: message

      click_on "Send"

      expect(page).to have_content(subject)
      expect(page).to have_content(message)
      expect(page).to have_content(current_teacher.first_name)
      expect(page).to have_content(current_teacher.second_name)
    end
  end

  context "Mail teacher" do
    include_context "current teacher signed in"

    scenario "Send correct mail" do
      visit new_teachers_conversation_path

      select "teacher", from: :profile_role
      select teacher.first_name, from: :profile_id
      fill_in :subject, with: subject
      fill_in :body, with: message

      click_on "Send"

      expect(page).to have_content(subject)
      expect(page).to have_content(message)
      expect(page).to have_content(current_teacher.first_name)
      expect(page).to have_content(current_teacher.second_name)
    end
  end

  context "Mail manager" do
    include_context "current teacher signed in"

    scenario "Send correct mail" do
      visit new_teachers_conversation_path

      select "manager", from: :profile_role
      select manager.first_name, from: :profile_id
      fill_in :subject, with: subject
      fill_in :body, with: message

      click_on "Send"

      expect(page).to have_content(subject)
      expect(page).to have_content(message)
      expect(page).to have_content(current_teacher.first_name)
      expect(page).to have_content(current_teacher.second_name)
    end
  end
end
