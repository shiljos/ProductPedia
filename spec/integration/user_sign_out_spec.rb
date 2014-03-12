require 'spec_helper'

feature "Sign out" do
  scenario "allows user to sign out" do
  	visit root_path
  	if page.has_content?('Logged in')
  	  expect(page).to have "a", text: "Logout"
  	  find('a').click
  	  expect(page).to have "p", text: "You need to sign in or sign up before continuing."
  	end
  end
end