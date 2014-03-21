require 'spec_helper'

feature "Sign out" do
  scenario "allows user to sign out" do
	  visit root_path
	  sign_in
	  click_link('Sign out')
	  expect(page).to have_css "p", text: "Signed out successfully."
  end
end