require 'rails_helper'

feature "user visits links index" do
  scenario "submits a valid link" do
    user = User.create(email: "test@example.com", password: "password")

    visit login_path

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_on "Login"

    fill_in "link[url]", with: "https://github.com"
    fill_in "link[title]", with: "github test title"
    click_on "Submit"

    expect(current_path).to eq(links_path)
    expect(page).to have_content("https://github.com")
    expect(page).to have_content("github test title")
  end
end
