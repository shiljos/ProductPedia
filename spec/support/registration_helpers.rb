module RegistrationHelpers
  def sign_up
    visit new_user_registration_path
    fill_in 'Email', 					with: 'shiljos@example.com'
    fill_in 'Password', 				with: 'shiljokralju'  
    fill_in 'Password confirmation', 	with: 'shiljokralju'
    click_button 'Sign up'
  end
end

RSpec.configure do |config|
  config.include RegistrationHelpers
end