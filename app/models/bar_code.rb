class BarCode < ActiveRecord::Base
	belongs_to :product

	#validates :barcode, format: { with: /\d{13}/, message: "only 13 digits"}
end
