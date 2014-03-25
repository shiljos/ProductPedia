require 'factory_girl_rails'

namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do 
		@users = FactoryGirl.create_list(:user, 3)
		@category = FactoryGirl.create_list(:category, 3)
		@products = FactoryGirl.create_list(:product, 10, category: @category.first)
		@ingredients = FactoryGirl.create_list(:ingredient, 7)
		@nutritions = FactoryGirl.create_list(:nutrition, 7)
		@companies = FactoryGirl.create_list(:company, 10)
		@category_n = FactoryGirl.create(:category)	
		@product_n = FactoryGirl.create(:product, category: @category_n)
		@company_n = FactoryGirl.create(:company)

		@users.each do |user|
			@products.each do |product|
				FactoryGirl.create(:favorite, user: user, product: product)
			end
		end	

		@products.each do |product|
			#FactoryGirl.create(:category, product: product)
			FactoryGirl.create(:bar_code, product: product)
			#FactoryGirl.create(:new_info, product: product)
		end

		new_infos_1 = FactoryGirl.create_list(:new_info, 5, product: @products.first)

		new_infos_2 = FactoryGirl.create_list(:new_info, 2, product: @products.second)

		new_infos_3 = FactoryGirl.create_list(:new_info, 3, product: @product_n)

		# @users.each do |user|
		# 	new_infos_1.each do |new_info|
		# 		FactoryGirl.create(:feed, user: user, new_info: new_info)
		# 	end
		# 	new_infos_2.each do |new_info|
		# 		FactoryGirl.create(:feed, user: user, new_info: new_info)
		# 	end
		# 	new_infos_3.each do |new_info|
		# 	FactoryGirl.create(:feed, user: user, new_info: new_info)
		# 	end
		# end

		@products.each do |product|
			@companies.each do |company|
				FactoryGirl.create(:distributer, product: product, company: company)
				FactoryGirl.create(:manufacturer, product: product, company: company)
			end
		end



		
		FactoryGirl.create(:bar_code, product: @product_n)
		FactoryGirl.create(:manufacturer, product: @product_n, company: @company_n)
		FactoryGirl.create(:distributer, product: @product_n, company: @companies.first)




		@products.each do |product|
			@ingredients.each do |ingredient|
				FactoryGirl.create(:product_ingredient, product: product, ingredient: ingredient)
			end
		end
		@products.each do |product|
			@nutritions.each do |nutrition|
				FactoryGirl.create(:product_nut, product: product, nutrition: nutrition)
			end
		end




		@ingredients.each do |ingredient|
				FactoryGirl.create(:product_ingredient, product: @product_n, ingredient: ingredient)
		end

		@nutritions.each do |nutrition|
				FactoryGirl.create(:product_nut, product: @product_n, nutrition: nutrition)
		end
	end

	desc "Add nutella to prodcts"
	task nutella: :environment do
		@category = FactoryGirl.create(:category, name: "Condiments/Dressings")
		@nutella = FactoryGirl.create(:product, name: "Nutella", description: "Hazelnut Spread", category: @category)
		FactoryGirl.create(:bar_code, product: @nutella)
		@ferrero = FactoryGirl.create(:company, name: "Ferrero")

		@ingredient_1 = FactoryGirl.create(:ingredient, name: "Sugar")
		@ingredient_2 = FactoryGirl.create(:ingredient, name: "Hazelnut")
		@ingredient_3 = FactoryGirl.create(:ingredient, name: "Palm Oil")
		@ingredient_4 = FactoryGirl.create(:ingredient, name: "Cocoa")
		@ingredient_5 = FactoryGirl.create(:ingredient, name: "Milk")

		FactoryGirl.create(:product_ingredient, product: @nutella, ingredient: @ingredient_1)
		FactoryGirl.create(:product_ingredient, product: @nutella, ingredient: @ingredient_2)
		FactoryGirl.create(:product_ingredient, product: @nutella, ingredient: @ingredient_3)
		FactoryGirl.create(:product_ingredient, product: @nutella, ingredient: @ingredient_4)
	 	FactoryGirl.create(:product_ingredient, product: @nutella, ingredient: @ingredient_5)

		@nutrition_1 = FactoryGirl.create(:nutrition, name: "Cholesterol")
		@nutrition_2 = FactoryGirl.create(:nutrition, name: "Sodium")
		@nutrition_3 = FactoryGirl.create(:nutrition, name: "Protein")
		@nutrition_4 = FactoryGirl.create(:nutrition, name: "Calcium")
		@nutrition_5 = FactoryGirl.create(:nutrition, name: "Iron")

		FactoryGirl.create(:product_nut, product: @nutella, nutrition: @nutrition_1)
		FactoryGirl.create(:product_nut, product: @nutella, nutrition: @nutrition_2)
		FactoryGirl.create(:product_nut, product: @nutella, nutrition: @nutrition_3)
		FactoryGirl.create(:product_nut, product: @nutella, nutrition: @nutrition_4)
		FactoryGirl.create(:product_nut, product: @nutella, nutrition: @nutrition_5)

		FactoryGirl.create(:manufacturer, product: @nutella, company: @ferrero)
		FactoryGirl.create(:distributer, product: @nutella, company: @ferrero)
	end
end