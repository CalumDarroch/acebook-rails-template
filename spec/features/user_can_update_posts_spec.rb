require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can update posts and view them" do
    visit "/users/new"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Email", with: "john@doe.com"
    fill_in "Password", with: "john1234"
    click_button 'Submit'
    fill_in "Email", with: "john@doe.com"
    fill_in "Password", with: "john1234"
    click_button 'Submit'
    click_link "New post"
    fill_in "New", with: "Hello, world!"
    click_button "Post"
    click_link "Edit"
    expect(page).to have_content("Hello, world!")
    fill_in "Edit", with: "Hi, Earth!"
    click_button "Update"
    expect(page).to have_content("Hi, Earth!")
  end
end
