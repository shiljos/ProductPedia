require 'spec_helper'

feature "Products list" do
  scenario "allows user to see all products" do
    visit products_path
    expect(page).to have_css 'h1', text: 'Products'
    #expect(page).to have_selector('ul')
    #expect(page).to have_css 'li',  
  end

end