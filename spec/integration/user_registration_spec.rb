require 'spec_helper'

feature "Sign up user"  do
  scenario "allows user to register with email and password" do
  	sign_up
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end	
end