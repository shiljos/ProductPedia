require 'spec_helper'

feature "Sign in user" do
  scenario "allows user to sign in with email and password" do

  	@user = FactoryGirl.create(:user)
  	visit new_user_session_path
  	fill_in 'Email', 		with: @user.email
  	fill_in 'Password', 	with: @user.password
  	click_button 'Sign in'

  	expect(page).to have_content("Signed in successfully.")
  end
end