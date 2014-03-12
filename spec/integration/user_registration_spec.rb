require 'spec_helper'

feature "Sign up user"  do
  scenario "allows user to register with email and password" do

    visit new_user_registration_path
    fill_in 'Email', 					with: 'shiljos@example.com'
    fill_in 'Password', 				with: 'shiljokralju'  
    fill_in 'Password confirmation', 	with: 'shiljokralju'
    click_button 'Sign up'

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end	
end