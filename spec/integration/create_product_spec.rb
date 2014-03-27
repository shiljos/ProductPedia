require 'spec_helper'

feature "create new product" do
	scenario "allows user(with rights) to create a new product" do
		FactoryGirl.create(:category, name: "Meat")
		FactoryGirl.create(:ingredient)
		FactoryGirl.create(:nutrition)
		sign_in
		visit new_product_path
		fill_in 'Product name', 		with: 'nutella'
		fill_in 'Description', 			with: 'neki opis'
		fill_in 'Bar code', 				with: '1234567890987'
		select 	'Meat', 						from: 'Category'
		fill_in 'Ingredients', 			with: 'Voda'
		fill_in 'Nutritions',       with: 'Protein'
		fill_in 'Distributer', 			with: 'Distributer'
		fill_in 'Manufacturer',			with: 'Manufacturer'
		fill_in 'Warning',					with: 'A Warning'
		click_button 'Submit1'
		expect(page).to change {Product.count}
	end
end