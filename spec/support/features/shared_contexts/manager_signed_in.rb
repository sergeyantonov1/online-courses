shared_context "current manager signed in" do
  let(:current_manager) { create :manager }

  background do
    sign_in(current_manager.email, current_manager.password)
  end
end

shared_context "current manager signed in as super manager" do
  let(:current_manager) { create :manager, :with_super }

  background do
    sign_in(current_manager.email, current_manager.password)
  end
end

def sign_in(email, password)
  visit new_manager_session_path

  fill_form(:manager, email: email, password: password)
  click_button "Sign in"
end
