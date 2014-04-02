class ProductNut < ActiveRecord::Base
	belongs_to :product
	belongs_to :nutrition
	#validates :amount, :presence => true
end
