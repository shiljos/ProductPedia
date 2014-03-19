class CreateNewInfos < ActiveRecord::Migration
  def change
    create_table :new_infos do |t|
      t.string :info
      t.references :product
      t.timestamps
    end
  end
end
