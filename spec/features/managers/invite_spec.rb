require "rails_helper"

feature "Invite manager" do
  context "Super manager" do
    include_context "current manager signed in as super manager"

    scenario "send invite with valid credentials" do
      visit new_manager_invitation_path

      fill_form(
        :manager,
        email: "new_manager@example.com",
        first_name: "Jack",
        second_name: "Howard"
      )

      click_button "Send an invitation"

      expect(page).to have_content("An invitation email has been sent to new_manager@example.com")
    end

    scenario "send invite with invalid credentials" do
      visit new_manager_invitation_path

      fill_form(:manager, email: current_manager.email)

      click_button "Send an invitation"

      expect(page).to have_content("Manager could not be created")
    end
  end

  context "Ordinary manager" do
    include_context "current manager signed in"

    scenario "don't send invite" do
      visit new_manager_invitation_path

      expect(current_path).to eql(cabinet_admin_root_path)
    end
  end
end
