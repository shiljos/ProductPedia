require 'spec_helper'


describe 'View homepage' do
  it 'allows user to see content' do
  	visit root_path
  	expect(page).to have_title 'ProductPedia'
  end
end