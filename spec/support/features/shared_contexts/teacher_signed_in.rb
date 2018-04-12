shared_context "current teacher signed in" do
  let!(:current_teacher) { create :teacher }

  background do
    sign_in(current_teacher.email, current_teacher.password)
  end

  def sign_in(email, password)
    visit new_teacher_session_path
    fill_form(:teacher, email: email, password: password)
    click_button "Sign in"
  end
end
