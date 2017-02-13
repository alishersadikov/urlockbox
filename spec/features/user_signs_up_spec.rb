require 'rails_helper'

feature "user visit sign up path" do
  scenario "signs up for an account" do

    visit new_user_path

    fill_in "user[email]", with: "test@example.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_on "Submit"

    expect(current_path).to eq(links_path)
    expect(page).to have_content("Logged in with test@example.com")
  end

  scenario "signs up with an existing email address" do
    User.create(email: "test@example.com", password: "password1")
    visit new_user_path

    fill_in "user[email]", with: "test@example.com"
    fill_in "user[password]", with: "password2"
    fill_in "user[password_confirmation]", with: "password2"
    click_on "Submit"

    expect(page).to have_content("This email has been used!")
  end

  scenario "signs up with non-matching passwords" do

    visit new_user_path

    fill_in "user[email]", with: "test@example.com"
    fill_in "user[password]", with: "password1"
    fill_in "user[password_confirmation]", with: "password2"
    click_on "Submit"

    expect(page).to have_content("Password mismatch!")
  end
end
