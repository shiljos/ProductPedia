class Ingredient < ActiveRecord::Base
	has_many :product_ingredients
	has_many :products, :through => :product_ingredients
end
