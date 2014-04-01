class BarCode < ActiveRecord::Base
	belongs_to :product

	#validates :barcode, format: { with: /\d{13} | \d{8}/, message: "8 or 13 digits"}
end
