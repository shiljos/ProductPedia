class Company < ActiveRecord::Base
	has_many :distributers
	has_many :products, :through => :distributers
end
