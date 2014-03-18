class AddDetailsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :category, :string
    add_column :products, :warning, :string
  end
end
