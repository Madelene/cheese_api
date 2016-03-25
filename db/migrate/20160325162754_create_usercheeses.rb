class CreateUsercheeses < ActiveRecord::Migration
  def change
    create_table :usercheeses do |t|
      t.integer :user_id
      t.integer :cheese_id

      t.timestamps null: false
    end
  end
end
