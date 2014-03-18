require 'spec_helper'

feature "Bar code" do
	scenario "checks if a bar code is present" do
		@product = FactoryGirl.create(:product)
		@b_code = FactoryGirl.create(:bar_code, product: @product)
		visit product_path(@product)
		expect(page).to have_css 'p.barcode',text: @b_code.barcode
	end
end

feature "Nutrition data" do
	scenario "checks if nutrition data is present " do
		@product = FactoryGirl.build(:product)
		@b_code = FactoryGirl.create(:bar_code, product: @product)
		@nutrit = FactoryGirl.build(:nutrition)
		@product_nut = FactoryGirl.create(:product_nut, product: @product, nutrition: @nutrit)
		visit product_path(@product)
		expect(page).to have_css 'td', text: @product_nut.amount
	end
end

feature "Warning" do
	scenario "cheks if empty warning present" do
		@product = FactoryGirl.create(:product)
		@b_code = FactoryGirl.create(:bar_code, product: @product)
		visit product_path(@product)
		expect(page).to have_css '.warning', text: "No specific warnings are currently known for this product"
	end
end