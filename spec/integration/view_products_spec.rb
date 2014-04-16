require 'spec_helper'

feature "Products list" do
  scenario "allows user to see all products" do
    @category = FactoryGirl.create_list(:category, 5)
  	@products = FactoryGirl.create_list(:product, 5, category: @category.first)
    visit products_path
    @products.each do |prod|
    	expect(page).to have_css('.list-group', text: prod.name)
    	#expect(page).to have_link("View Product", href: product_path(prod)) 
    end
  end
end

feature "View product" do
	scenario "allows user to see product information" do
    @category = FactoryGirl.create_list(:category, 1)
	  @product = FactoryGirl.create(:product, category: @category.first)
    product_details_init(@product)
    sign_in
		visit products_path
    # expect(Product.count).to eq 1
    # expect(page).to have_link(@product.name , href: product_path(@product)) 
    expect(page).to have_content("Products")
		click_link(@product.name)
		expect(page).to have_css '.panel-heading', text: @product.name
	end
end

feature "Add favorite product" do
  scenario "allows user to add a product to favorite list" do
    @category = FactoryGirl.create_list(:category, 1)
    @product = FactoryGirl.create(:product, category: @category.first)
    product_details_init(@product)
    add_favorite
    expect(page).to have_link("Remove", href: remove_favorite_product_path(@product)) 
  end
end

feature "Remove favorite product" do
  scenario "allows user to remove product from favorite list" do
    @category = FactoryGirl.create(:category)
    @product = FactoryGirl.create(:product, category: @category)
    product_details_init(@product)
    add_favorite
    click_link 'Remove'
    #expect(page).not_to have_css '.favorite', text:@product.name
    expect(page).not_to have_link("Remove", href: remove_favorite_product_path(@product))
  end
end

feature "Check favorites" do
  scenario "is testing if a logged in user sees favorites of other user" do
    @category = FactoryGirl.create(:category)
    @product = FactoryGirl.create(:product)
    product_details_init(@product)
    @user_1 = FactoryGirl.create(:user)
    @user_2 = FactoryGirl.create(:user) 
    sign_in_as(@user_1)
    click_link 'Products'
    click_link @product.name
    add_favorite_as(@user_1, @product)
    click_link 'Sign out'
    click_link 'Sign in'
    sign_in_as(@user_2)
    click_link 'Products'
    click_link @product.name
    expect(page).not_to have_link("Remove", href: remove_favorite_product_path(@product))
    #expect(page).not_to have_css '.favorite', text: @product.name
  end

  scenario "checks if a favorite can be deleted from another user" do
    @category = FactoryGirl.create(:category)
    @product = FactoryGirl.create(:product)
    product_details_init(@product)
    @user_1 = FactoryGirl.create(:user)
    @user_2 = FactoryGirl.create(:user) 
    sign_in_as(@user_1)
    click_link 'Products'
    click_link @product.name
    add_favorite_as(@user_1, @product)
    click_link 'Sign out'
    click_link 'Sign in'
    sign_in_as(@user_2)
    expect{page.driver.submit :delete, remove_favorite_product_path(@product), {}}.not_to change {Favorite.count}
  end
end

# feature "Search products" do
#   scenario "allows user to search for products" do
#     @products = FactoryGirl.create_list(:product, 5)
#     visit products_path
#     fill_in 'search', with: @products.first.name
#     click_button 'Search'
#     expect(page).to have_css '.list-group', text: @products.first.name
#     expect(page).to have_css '.list-group', count: 1
#   end
# end