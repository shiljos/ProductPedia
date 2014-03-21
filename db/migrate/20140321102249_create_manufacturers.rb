class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
    	t.references :product
    	t.references :company
      t.timestamps
    end
  end
end
