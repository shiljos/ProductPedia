class Company < ActiveRecord::Base
	has_many :distributers
	has_many :products, :through => :distributers
	has_many :manufacturers
	has_many :products, :through => :manufacturers
end
