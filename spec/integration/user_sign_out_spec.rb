require 'spec_helper'

feature "Sign out" do
  scenario "allows user to sign out" do
	  visit root_path
	  sign_in
	  expect(page).to have_css ".login", text: "Logged in"
	  click_link('Logout')
	  expect(page).to have_css "p", text: "Signed out successfully."
  end
end