class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.references :new_info
      t.references :user
      t.timestamps
    end
  end
end
