require 'spec_helper'


describe 'View homepage' do
  it 'user sees content' do
  	visit root_path
  	expect(page).to have_title 'ProductPedia'
  end

  it 'Search for products' do
  	visit root_path
  	fill_in 'search', with: 'proizvod'
  	click_button 'Search'
  	#expect(page).to have_selector('div input', 'proizvod')
  end
end