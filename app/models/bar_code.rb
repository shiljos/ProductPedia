class BarCode < ActiveRecord::Base
	belongs_to :product

	validates :barcode, format: { with: /\A([0-9]{8}|[0-9]{13})\Z/, message: "8 or 13 digits"}
end
