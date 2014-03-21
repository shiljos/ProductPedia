require 'factory_girl_rails'

namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do 
		@users = FactoryGirl.create_list(:user, 3)
		@products = FactoryGirl.create_list(:product, 10)
		@ingredients = FactoryGirl.create_list(:ingredient, 7)
		@nutritions = FactoryGirl.create_list(:nutrition, 7)
		@companies = FactoryGirl.create_list(:company, 10)
		@product_n = FactoryGirl.create(:product)
		@company_n = FactoryGirl.create(:company)

		@users.each do |user|
			@products.each do |product|
				FactoryGirl.create(:favorite, user: user, product: product)
			end
		end	

		@products.each do |product|
			FactoryGirl.create(:category, product: product)
			FactoryGirl.create(:bar_code, product: product)
			#FactoryGirl.create(:new_info, product: product)
		end

		new_infos_1 = FactoryGirl.create_list(:new_info, 5, product: @products.first)

		new_infos_2 = FactoryGirl.create_list(:new_info, 2, product: @products.second)

		new_infos_3 = FactoryGirl.create_list(:new_info, 3, product: @product_n)

		@users.each do |user|
			new_infos_1.each do |new_info|
				FactoryGirl.create(:feed, user: user, new_info: new_info)
			end
			new_infos_2.each do |new_info|
				FactoryGirl.create(:feed, user: user, new_info: new_info)
			end
			new_infos_3.each do |new_info|
			FactoryGirl.create(:feed, user: user, new_info: new_info)
			end
		end

		@products.each do |product|
			@companies.each do |company|
				FactoryGirl.create(:distributer, product: product, company: company)
				FactoryGirl.create(:manufacturer, product: product, company: company)
			end
		end



		FactoryGirl.create(:category, product: @product_n)	
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
end