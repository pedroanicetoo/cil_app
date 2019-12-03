class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :client

      t.timestamps
    end
    add_index :carts, :client_id
  end
end
