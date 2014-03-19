require 'factory_girl_rails'

namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do 
		@users = FactoryGirl.create_list(:user, 5)
		@products = FactoryGirl.create_list(:product, 30)
		@ingredients = FactoryGirl.create_list(:ingredient, 15)
		@nutritions = FactoryGirl.create_list(:nutrition, 15)
		@companies = FactoryGirl.create_list(:company, 30)
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

		new_infos_1 = FactoryGirl.create_list(:new_info,5, product: @products.first)

		@users.each do |user|
			new_infos_1.each do |new_info|
				FactoryGirl.create(:feed, user: user, new_info: new_info)
			end
		end	


		@products.each do |product|
			@companies.each do |company|
				FactoryGirl.create(:distributer, product: product, company: company)
			end
		end
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
	end
end