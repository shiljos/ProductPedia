class Company < ActiveRecord::Base
	has_many :distributers
	has_many :distributed_products, :through => :distributers, :source => :product
	has_many :manufacturers
	has_many :manufactured_products, :through => :manufacturers, :source => :product
end
