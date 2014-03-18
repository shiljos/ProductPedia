class Nutrition < ActiveRecord::Base
	has_many :products, :through => :product_nuts
	has_many :product_nuts
end
