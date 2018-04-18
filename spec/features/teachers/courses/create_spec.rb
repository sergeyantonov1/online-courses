require "rails_helper"

feature "Teacher creates new course" do
  include_context "current teacher signed in"

  let(:course_attributes) { attributes_for(:course) }
  let(:created_course) { Course.find_by(title: course_attributes[:title]) }

  background do
    visit teachers_courses_path
    click_on "Create new course"
  end

  scenario "with valid parameters" do
    fill_in :course_title, with: course_attributes[:title]
    fill_in :course_description, with: course_attributes[:description]

    click_button "Create Course"

    expect(page).to have_content created_course.title
  end

  scenario "with empty title" do
    fill_in :course_title, with: course_attributes[:title]
    fill_in :course_description, with: ""

    click_button "Create Course"

    expect(page).to have_content "can't be blank"
  end

  scenario "with empty description" do
    fill_in :course_title, with: ""
    fill_in :course_description, with: course_attributes[:description]

    click_button "Create Course"

    expect(page).to have_content "can't be blank"
  end
end
