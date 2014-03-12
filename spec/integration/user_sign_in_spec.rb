require 'spec_helper'

feature "Sign in user" do
  scenario "allows user to sign in with email and password" do
  	sign_in
  	expect(page).to have_content("Signed in successfully.")
  end
end