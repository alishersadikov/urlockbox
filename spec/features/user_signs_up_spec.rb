require 'rails_helper'

feature "user visit sign up path" do
  scenario "signs up for an account" do

    visit new_user_path



    fill_in "user[email]", with: "test@example.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_on "Submit"

    expect(current_path).to eq(links_path)
  end
end
