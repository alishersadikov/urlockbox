require 'rails_helper'

feature "user visits login path" do
  scenario "logs in" do
    user = User.create(email: "test@example.com", password: "password")

    visit login_path

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_on "Login"

    expect(current_path).to eq(links_path)
    expect(page).to have_content("Successfully logged in")
    expect(page).to have_content("Logged in with #{user.email}")
  end

  scenario "logs in with incorrect credentials" do
    user = User.create(email: "test@example.com", password: "password")

    visit login_path

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: "wrong_password"
    click_on "Login"

    expect(page).to have_content("Something went wrong. Try again")
  end
end
