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

  scenario "submits an invalid link" do
    user = User.create(email: "test@example.com", password: "password")

    visit login_path

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_on "Login"

    fill_in "link[url]", with: "example.wrong"
    fill_in "link[title]", with: "wrong title"
    click_on "Submit"

    expect(current_path).to eq(links_path)
    expect(page).to have_content("Invalid URI!")
  end

  scenario "submits a valid link without a title" do
    user = User.create(email: "test@example.com", password: "password")

    visit login_path

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_on "Login"

    fill_in "link[url]", with: "https://github.com"
    fill_in "link[title]", with: ""
    click_on "Submit"

    expect(current_path).to eq(links_path)
    expect(page).to have_content("Please enter a title")
  end
end
