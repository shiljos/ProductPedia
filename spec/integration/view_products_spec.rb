require 'spec_helper'

feature "Products list" do
  scenario "allows user to see all products" do
  	@products = FactoryGirl.create_list(:product, 5)
    visit products_path
    @products.each do |prod|
    	expect(page).to have_selector('li', text: prod.name)
    	expect(page).to have_link("View Product", href: product_path(prod)) 
    end
  end
end

feature "View product" do
	scenario "allows user to see product information" do
		@product = FactoryGirl.create(:product)
    sign_in
		visit products_path
		click_link('View Product')
		expect(page).to have_css '.description', text: @product.description
	end
end

feature "Edit product description" do
	scenario "allows user to edit product description" do
		@product = FactoryGirl.create(:product)
    sign_in
		visit product_path(@product)
		fill_in 'product_description', with: 'new product_7 description'
		click_button 'Submit change'

		expect(page).to have_css '.description', text: 'new product_7 description'
	end
end

feature "Add favorite product" do
  scenario "allows user to add a product to favorite list" do
    @product = FactoryGirl.create(:product)
    add_favorite
    expect(page).to have_css '.favorite', text: @product.name
  end
end

feature "Remove favorite product" do
  scenario "allows user to remove product from favorite list" do
    @product = FactoryGirl.create(:product)
    add_favorite
    click_link 'Remove product from favorites'
    expect(page).not_to have_css '.favorite', text:@product.name
  end
end

feature "Search products" do
  scenario "allows user to search for products" do
    @products = FactoryGirl.create_list(:product, 5)
    visit products_path
    fill_in 'search', with: @products.first.name
    click_button 'Search'
    expect(page).to have_css '.result', text: @products.first.name
    expect(page).to have_css '.result', count: 1
  end
end