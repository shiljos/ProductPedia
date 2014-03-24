class CreateNutritions < ActiveRecord::Migration
  def change
    create_table :nutritions do |t|
      t.string :name,  	:null => false

      t.timestamps
    end
  end
end
