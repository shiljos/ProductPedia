require 'factory_girl_rails'

namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do 
		@users = FactoryGirl.create_list(:user, 3)
		@category = FactoryGirl.create_list(:category, 3)
		#@products = FactoryGirl.create_list(:product, 10, category: @category.first)
		#@ingredients = FactoryGirl.create_list(:ingredient, 7)
		#@nutritions = FactoryGirl.create_list(:nutrition, 7)
		#@companies = FactoryGirl.create_list(:company, 10)
		@category_n = FactoryGirl.create(:category)	

		@product_n = FactoryGirl.create(:product, category: @category_n)
		@product1 = FactoryGirl.create(:product, category: @category.first)
		@product2 = FactoryGirl.create(:product, category: @category.first)
		@product3 = FactoryGirl.create(:product, category: @category.first)
		@product4 = FactoryGirl.create(:product, category: @category.second)
		@product5 = FactoryGirl.create(:product, category: @category.second)
		@product6 = FactoryGirl.create(:product, category: @category.second)
		@product7 = FactoryGirl.create(:product, category: @category.last)
		@product8 = FactoryGirl.create(:product, category: @category.last)
		@product9 = FactoryGirl.create(:product, category: @category.last)

		@company1 = FactoryGirl.create(:company)
		@company2 = FactoryGirl.create(:company)
		@company3 = FactoryGirl.create(:company)
		@company4 = FactoryGirl.create(:company)
		@company5 = FactoryGirl.create(:company)
		@company6 = FactoryGirl.create(:company)
		@company7 = FactoryGirl.create(:company)
		@company8 = FactoryGirl.create(:company)
		@company9 = FactoryGirl.create(:company)

		@ingredient1 = FactoryGirl.create(:ingredient, name: "Water")
		@ingredient2 = FactoryGirl.create(:ingredient, name: "Milk")
		@ingredient3 = FactoryGirl.create(:ingredient, name: "Cocoa")
		@ingredient4 = FactoryGirl.create(:ingredient, name: "Sugar")
		@ingredient5 = FactoryGirl.create(:ingredient, name: "Hazelnut")
		@ingredient6 = FactoryGirl.create(:ingredient, name: "Butter")
		@ingredient7 = FactoryGirl.create(:ingredient, name: "Lime")
		@ingredient8 = FactoryGirl.create(:ingredient, name: "Flour")

		@nutrition1 = FactoryGirl.create(:nutrition, name: "Protein")
		@nutrition2 = FactoryGirl.create(:nutrition, name: "Sodium")
		@nutrition3 = FactoryGirl.create(:nutrition, name: "Carbohydrate")
		@nutrition4 = FactoryGirl.create(:nutrition, name: "Potassium")
		@nutrition5 = FactoryGirl.create(:nutrition, name: "Cholesterol")
		@nutrition6 = FactoryGirl.create(:nutrition, name: "Calcium")
		@nutrition7 = FactoryGirl.create(:nutrition, name: "Iron")
		@nutrition8 = FactoryGirl.create(:nutrition, name: "Magnesium")

		# @users.each do |user|
		# 	@products.each do |product|
		# 		FactoryGirl.create(:favorite, user: user, product: product)
		# 	end
		# end	

		# @products.each do |product|
		# 	#FactoryGirl.create(:category, product: product)
		# 	FactoryGirl.create(:bar_code, product: product)
		# 	#FactoryGirl.create(:new_info, product: product)
		# end
		FactoryGirl.create(:bar_code, product: @product1)
		FactoryGirl.create(:bar_code, product: @product2)
		FactoryGirl.create(:bar_code, product: @product3)
		FactoryGirl.create(:bar_code, product: @product4)
		FactoryGirl.create(:bar_code, product: @product5)
		FactoryGirl.create(:bar_code, product: @product6)
		FactoryGirl.create(:bar_code, product: @product7)
		FactoryGirl.create(:bar_code, product: @product8)
		FactoryGirl.create(:bar_code, product: @product9)



		#new_infos_1 = FactoryGirl.create_list(:new_info, 5, product: @products.first)
		new_infos_1 = FactoryGirl.create_list(:new_info, 5, product: @product1)

		#new_infos_2 = FactoryGirl.create_list(:new_info, 2, product: @products.second)
		new_infos_2 = FactoryGirl.create_list(:new_info, 5, product: @product2)

		#new_infos_3 = FactoryGirl.create_list(:new_info, 3, product: @product_n)
		new_infos_3 = FactoryGirl.create_list(:new_info, 5, product: @product3)

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

		# @products.each do |product|
		# 	@companies.each do |company|
		# 		FactoryGirl.create(:distributer, product: product, company: company)
		# 		FactoryGirl.create(:manufacturer, product: product, company: company)
		# 	end
		# end
		FactoryGirl.create(:distributer, product: @product1, company: @company1)
		FactoryGirl.create(:manufacturer, product: @product1, company: @company2)
		FactoryGirl.create(:distributer, product: @product2, company: @company2)
		FactoryGirl.create(:manufacturer, product: @product2, company: @company1)
		FactoryGirl.create(:distributer, product: @product3, company: @company4)
		FactoryGirl.create(:manufacturer, product: @product3, company: @company3)
		FactoryGirl.create(:distributer, product: @product4, company: @company3)
		FactoryGirl.create(:manufacturer, product: @product4, company: @company4)
		FactoryGirl.create(:distributer, product: @product5, company: @company6)
		FactoryGirl.create(:manufacturer, product: @product5, company: @company5)
		FactoryGirl.create(:distributer, product: @product6, company: @company5)
		FactoryGirl.create(:manufacturer, product: @product6, company: @company6)
		FactoryGirl.create(:distributer, product: @product7, company: @company7)
		FactoryGirl.create(:manufacturer, product: @product7, company: @company6)
		FactoryGirl.create(:distributer, product: @product8, company: @company6)
		FactoryGirl.create(:manufacturer, product: @product8, company: @company7)
		FactoryGirl.create(:distributer, product: @product9, company: @company8)
		FactoryGirl.create(:manufacturer, product: @product9, company: @company9)

		
		FactoryGirl.create(:bar_code, product: @product_n)
		FactoryGirl.create(:manufacturer, product: @product_n, company: @company7)
		FactoryGirl.create(:distributer, product: @product_n, company: @company1)




		# @products.each do |product|
		# 	@ingredients.each do |ingredient|
		# 		FactoryGirl.create(:product_ingredient, product: product, ingredient: ingredient)
		# 	end
		# end
		FactoryGirl.create(:product_ingredient, product: @product1, ingredient: @ingredient1)
		FactoryGirl.create(:product_ingredient, product: @product1, ingredient: @ingredient2)
		FactoryGirl.create(:product_ingredient, product: @product1, ingredient: @ingredient3)
		FactoryGirl.create(:product_ingredient, product: @product1, ingredient: @ingredient4)
		FactoryGirl.create(:product_ingredient, product: @product1, ingredient: @ingredient5)
		FactoryGirl.create(:product_ingredient, product: @product1, ingredient: @ingredient6)
		FactoryGirl.create(:product_ingredient, product: @product1, ingredient: @ingredient7)

		FactoryGirl.create(:product_ingredient, product: @product2, ingredient: @ingredient1)
		FactoryGirl.create(:product_ingredient, product: @product2, ingredient: @ingredient3)
		FactoryGirl.create(:product_ingredient, product: @product2, ingredient: @ingredient8)
		FactoryGirl.create(:product_ingredient, product: @product2, ingredient: @ingredient2)

		FactoryGirl.create(:product_ingredient, product: @product3, ingredient: @ingredient2)
		FactoryGirl.create(:product_ingredient, product: @product3, ingredient: @ingredient4)
		FactoryGirl.create(:product_ingredient, product: @product3, ingredient: @ingredient6)

		FactoryGirl.create(:product_ingredient, product: @product4, ingredient: @ingredient3)
		FactoryGirl.create(:product_ingredient, product: @product4, ingredient: @ingredient6)
		FactoryGirl.create(:product_ingredient, product: @product4, ingredient: @ingredient5)
		FactoryGirl.create(:product_ingredient, product: @product4, ingredient: @ingredient7)
		FactoryGirl.create(:product_ingredient, product: @product4, ingredient: @ingredient8)

		FactoryGirl.create(:product_ingredient, product: @product5, ingredient: @ingredient1)
		FactoryGirl.create(:product_ingredient, product: @product5, ingredient: @ingredient2)
		FactoryGirl.create(:product_ingredient, product: @product5, ingredient: @ingredient4)
		FactoryGirl.create(:product_ingredient, product: @product5, ingredient: @ingredient3)
		FactoryGirl.create(:product_ingredient, product: @product5, ingredient: @ingredient5)
		FactoryGirl.create(:product_ingredient, product: @product5, ingredient: @ingredient7)

		FactoryGirl.create(:product_ingredient, product: @product6, ingredient: @ingredient1)
		FactoryGirl.create(:product_ingredient, product: @product6, ingredient: @ingredient2)
		FactoryGirl.create(:product_ingredient, product: @product6, ingredient: @ingredient3)

		FactoryGirl.create(:product_ingredient, product: @product7, ingredient: @ingredient4)
		FactoryGirl.create(:product_ingredient, product: @product7, ingredient: @ingredient1)
		FactoryGirl.create(:product_ingredient, product: @product7, ingredient: @ingredient5)

		FactoryGirl.create(:product_ingredient, product: @product8, ingredient: @ingredient3)
		FactoryGirl.create(:product_ingredient, product: @product8, ingredient: @ingredient2)
		FactoryGirl.create(:product_ingredient, product: @product8, ingredient: @ingredient5)

		FactoryGirl.create(:product_ingredient, product: @product9, ingredient: @ingredient6)
		FactoryGirl.create(:product_ingredient, product: @product9, ingredient: @ingredient5)
		FactoryGirl.create(:product_ingredient, product: @product9, ingredient: @ingredient8)

		FactoryGirl.create(:product_ingredient, product: @product_n, ingredient: @ingredient1)
		FactoryGirl.create(:product_ingredient, product: @product_n, ingredient: @ingredient2)
		FactoryGirl.create(:product_ingredient, product: @product_n, ingredient: @ingredient3)
		FactoryGirl.create(:product_ingredient, product: @product_n, ingredient: @ingredient4)
		FactoryGirl.create(:product_ingredient, product: @product_n, ingredient: @ingredient5)

		# @products.each do |product|
		# 	@nutritions.each do |nutrition|
		# 		FactoryGirl.create(:product_nut, product: product, nutrition: nutrition)
		# 	end
		# end
		FactoryGirl.create(:product_nut, product: @product1, nutrition: @nutrition1)
		FactoryGirl.create(:product_nut, product: @product1, nutrition: @nutrition2)
		FactoryGirl.create(:product_nut, product: @product1, nutrition: @nutrition3)
		FactoryGirl.create(:product_nut, product: @product1, nutrition: @nutrition4)
		FactoryGirl.create(:product_nut, product: @product1, nutrition: @nutrition5)
		FactoryGirl.create(:product_nut, product: @product1, nutrition: @nutrition6)
		FactoryGirl.create(:product_nut, product: @product1, nutrition: @nutrition7)

		FactoryGirl.create(:product_nut, product: @product2, nutrition: @nutrition7)
		FactoryGirl.create(:product_nut, product: @product2, nutrition: @nutrition4)
		FactoryGirl.create(:product_nut, product: @product2, nutrition: @nutrition3)
		FactoryGirl.create(:product_nut, product: @product2, nutrition: @nutrition1)
		FactoryGirl.create(:product_nut, product: @product2, nutrition: @nutrition2)

		FactoryGirl.create(:product_nut, product: @product3, nutrition: @nutrition2)
		FactoryGirl.create(:product_nut, product: @product3, nutrition: @nutrition4)
		FactoryGirl.create(:product_nut, product: @product3, nutrition: @nutrition1)
		FactoryGirl.create(:product_nut, product: @product3, nutrition: @nutrition5)
		FactoryGirl.create(:product_nut, product: @product3, nutrition: @nutrition7)
		FactoryGirl.create(:product_nut, product: @product3, nutrition: @nutrition4)

		FactoryGirl.create(:product_nut, product: @product4, nutrition: @nutrition1)
		FactoryGirl.create(:product_nut, product: @product4, nutrition: @nutrition2)
		FactoryGirl.create(:product_nut, product: @product4, nutrition: @nutrition3)
		FactoryGirl.create(:product_nut, product: @product4, nutrition: @nutrition4)

		FactoryGirl.create(:product_nut, product: @product5, nutrition: @nutrition1)
		FactoryGirl.create(:product_nut, product: @product5, nutrition: @nutrition4)
		FactoryGirl.create(:product_nut, product: @product5, nutrition: @nutrition5)
		FactoryGirl.create(:product_nut, product: @product5, nutrition: @nutrition6)
		FactoryGirl.create(:product_nut, product: @product5, nutrition: @nutrition7)

		FactoryGirl.create(:product_nut, product: @product6, nutrition: @nutrition1)
		FactoryGirl.create(:product_nut, product: @product6, nutrition: @nutrition2)
		FactoryGirl.create(:product_nut, product: @product6, nutrition: @nutrition3)
		FactoryGirl.create(:product_nut, product: @product6, nutrition: @nutrition4)
		FactoryGirl.create(:product_nut, product: @product6, nutrition: @nutrition5)
		FactoryGirl.create(:product_nut, product: @product6, nutrition: @nutrition6)

		FactoryGirl.create(:product_nut, product: @product7, nutrition: @nutrition4)
		FactoryGirl.create(:product_nut, product: @product7, nutrition: @nutrition1)
		FactoryGirl.create(:product_nut, product: @product7, nutrition: @nutrition2)
		FactoryGirl.create(:product_nut, product: @product7, nutrition: @nutrition3)
		FactoryGirl.create(:product_nut, product: @product7, nutrition: @nutrition5)
		FactoryGirl.create(:product_nut, product: @product7, nutrition: @nutrition6)
		FactoryGirl.create(:product_nut, product: @product7, nutrition: @nutrition7)

		FactoryGirl.create(:product_nut, product: @product8, nutrition: @nutrition7)
		FactoryGirl.create(:product_nut, product: @product8, nutrition: @nutrition5)
		FactoryGirl.create(:product_nut, product: @product8, nutrition: @nutrition3)
		FactoryGirl.create(:product_nut, product: @product8, nutrition: @nutrition1)
		FactoryGirl.create(:product_nut, product: @product8, nutrition: @nutrition4)

		FactoryGirl.create(:product_nut, product: @product9, nutrition: @nutrition1)
		FactoryGirl.create(:product_nut, product: @product9, nutrition: @nutrition2)
		FactoryGirl.create(:product_nut, product: @product9, nutrition: @nutrition3)
		FactoryGirl.create(:product_nut, product: @product9, nutrition: @nutrition4)

		FactoryGirl.create(:product_nut, product: @product_n, nutrition: @nutrition1)
		FactoryGirl.create(:product_nut, product: @product_n, nutrition: @nutrition2)
		FactoryGirl.create(:product_nut, product: @product_n, nutrition: @nutrition3)
		FactoryGirl.create(:product_nut, product: @product_n, nutrition: @nutrition4)

		# @ingredients.each do |ingredient|
		# 		FactoryGirl.create(:product_ingredient, product: @product_n, ingredient: ingredient)
		# end

		# @nutritions.each do |nutrition|
		# 		FactoryGirl.create(:product_nut, product: @product_n, nutrition: nutrition)
		# end
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