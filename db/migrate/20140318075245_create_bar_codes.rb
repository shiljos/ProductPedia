class CreateBarCodes < ActiveRecord::Migration
  def change
    create_table :bar_codes do |t|
      t.string :barcode,  	:null => false
	  t.references :product
      t.timestamps
    end
  end
end
