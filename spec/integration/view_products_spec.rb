require 'spec_helper'

feature "Products list" do
  scenario "allows user to see all products" do
  	5.times { FactoryGirl.create(:product) }
    visit products_path
    expect(page).to have_css 'h1', text: 'Products' 
    Product.all.each do |prod|
    	expect(page).to have_selector('li', text: prod.name)
    	expect(page).to have_link("View Product", href: product_path(prod)) 
    end
  end
end

feature "View product" do
	scenario "allowss user to see product information" do
		product = FactoryGirl.create(:product)
		visit products_path
		click_link('View Product')
		expect(page).to have_css 'div', text: ''
	end
end