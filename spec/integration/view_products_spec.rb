require 'spec_helper'

feature "Products list" do
  scenario "allows user to see all products" do
  	5.times { FactoryGirl.create(:product) }
    visit products_path
   # expect(page).to have_css 'h1', text: 'Products' 
    Product.all.each do |prod|
    	expect(page).to have_selector('li', text: prod.name)
    	expect(page).to have_link("View Product", href: product_path(prod)) 
    end
  end
end

feature "View product" do
	scenario "allows user to see product information" do
		@product = FactoryGirl.create(:product)
		visit products_path
		click_link('View Product')
		expect(page).to have_css '.description', text: @product.description
	end
end

feature "Edit product description" do
	scenario "allows user to edit product description" do
		@product = FactoryGirl.create(:product)
		visit product_path(@product)
		fill_in 'product_description', with: 'new product_7 description'
		click_button 'Submit change'

		expect(page).to have_css '.description', text: 'new product_7 description'
	end
end

feature "Add favorite product" do
  scenario "allows user to add a product to favorite list" do
  	@product = FactoryGirl.create(:product)
  	sign_in
    visit product_path(@product)
    expect(page).to have_css '.favorite'
  end
end