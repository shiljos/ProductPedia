require 'spec_helper'

feature "Bar code" do
	scenario "checks if a bar code is present" do
		@product = FactoryGirl.create(:product)
		@b_code = FactoryGirl.create(:bar_code, product: @product)
		@company = FactoryGirl.create(:company)
  	@distributer = FactoryGirl.create(:distributer, product: @product, company: @company)
  	@manufacturer = FactoryGirl.create(:manufacturer, product: @product, company: @company)
  	@category = FactoryGirl.create(:category, product: @product)
		visit product_path(@product)
		expect(page).to have_css '.panel-body',text: @b_code.barcode
	end
end

feature "Nutrition data" do
	scenario "checks if nutrition data is present " do
		@product = FactoryGirl.build(:product)
		@b_code = FactoryGirl.create(:bar_code, product: @product)
		@company = FactoryGirl.create(:company)
  	@distributer = FactoryGirl.create(:distributer, product: @product, company: @company)
  	@manufacturer = FactoryGirl.create(:manufacturer, product: @product, company: @company)
  	@category = FactoryGirl.create(:category, product: @product)
		@nutrit = FactoryGirl.build(:nutrition)
		@product_nut = FactoryGirl.create(:product_nut, product: @product, nutrition: @nutrit)
		visit product_path(@product)
		expect(page).to have_css 'td', text: @product_nut.amount
	end
end

#Nije jos uvijek ugradjeno u prikaz
# feature "Warning" do
# 	scenario "cheks if empty warning present" do
# 		@product = FactoryGirl.create(:product)
# 		@b_code = FactoryGirl.create(:bar_code, product: @product)
# 		@company = FactoryGirl.create(:company)
#   	@distributer = FactoryGirl.create(:distributer, product: @product, company: @company)
#   	@manufacturer = FactoryGirl.create(:manufacturer, product: @product, company: @company)
#   	@category = FactoryGirl.create(:category, product: @product)
# 		visit product_path(@product)
# 		expect(page).to have_css '.warning', text: "No specific warnings are currently known for this product"
# 	end
# end

feature "Ingredients" do
	scenario "checks for product ingredients" do
		@product = FactoryGirl.create(:product)
		@b_code = FactoryGirl.create(:bar_code, product: @product)
		@company = FactoryGirl.create(:company)
  	@distributer = FactoryGirl.create(:distributer, product: @product, company: @company)
  	@manufacturer = FactoryGirl.create(:manufacturer, product: @product, company: @company)
  	@category = FactoryGirl.create(:category, product: @product)
		@ingredient = FactoryGirl.create(:ingredient)
		@product_ing = FactoryGirl.create(:product_ingredient, product: @product, ingredient: @ingredient)
		visit product_path(@product)
		expect(page).to have_css '.ingredientname', text: @ingredient.name
	end
end