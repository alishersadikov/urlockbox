require 'rails_helper'

feature "user visits login path" do
  scenario "logs in" do
    user = User.create(email: "test@example.com", password: "password")

    visit login_path

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_on "Login"

    expect(current_path).to eq(links_path)
  end
end
