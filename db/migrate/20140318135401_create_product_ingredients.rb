class CreateProductIngredients < ActiveRecord::Migration
  def change
    create_table :product_ingredients do |t|
      t.references :product
      t.references :ingredient
      t.timestamps
    end
  end
end
