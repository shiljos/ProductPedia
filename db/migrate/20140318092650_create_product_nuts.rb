class CreateProductNuts < ActiveRecord::Migration
  def change
    create_table :product_nuts do |t|
      t.references :product
      t.references :nutrition
      t.float :amount
      t.timestamps
    end
  end
end
