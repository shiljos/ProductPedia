class Ingredient < ActiveRecord::Base
	has_many :product_ingredients
	has_many :ingredients, :through => :product_ingredients
end
