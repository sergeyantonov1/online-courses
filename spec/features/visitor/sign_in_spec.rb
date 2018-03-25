require "rails_helper"

feature "Sign In" do
  let(:user) { create :user }
  let(:unconfirmed_user) { create :user, :not_confirmed }
  let(:manager) { create :manager }

  def sign_in_as_user(email, password)
    visit new_user_session_path

    fill_form(:user, email: email, password: password)
    click_button "Sign in"
  end

  def sign_in_as_manager(email, password)
    visit new_manager_session_path

    fill_form(:manager, email: email, password: password)
    click_button "Sign in"
  end

  context "Visitor signs in as manager" do
    scenario "with valid credentials" do
      sign_in_as_manager(manager.email, manager.password)

      expect(page).to have_content("Sign out")
    end

    scenario "with invalid credentials" do
      sign_in_as_manager(manager.email, "wrong password")

      expect(page).to have_content("Sign in")
      expect(page).to have_content("Invalid Email or password")
    end
  end

  context "Visitor signs in as user" do
    scenario "Visitor signs in with valid credentials" do
      sign_in_as_user(user.email, user.password)

      expect(page).to have_content("Sign out")
    end

    scenario "Visitor signs in with invalid credentials" do
      sign_in_as_user(user.email, "wrong password")

      expect(page).to have_content("Sign in")
      expect(page).to have_content("Invalid Email or password")
    end

    scenario "Visitor signs in with unconfirmed email address" do
      sign_in_as_user(unconfirmed_user.email, user.password)

      expect(page).to have_content("You have to confirm your email address before continuing.")
    end
  end
end
