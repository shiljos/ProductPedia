class CreateDistributers < ActiveRecord::Migration
  def change
    create_table :distributers do |t|
      t.references :product
      t.references :company
      t.timestamps
    end
  end
end
