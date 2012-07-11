class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :title
      t.string :url
      t.test :body
      t.references :user

      t.timestamps
    end
    add_index :stores, :user_id
  end
end
