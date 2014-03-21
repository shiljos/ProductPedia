class Manufacturer < ActiveRecord::Base
	belongs_to :product
	belongs_to :company
end
