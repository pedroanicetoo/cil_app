class CreateDemands < ActiveRecord::Migration
  def change
    create_table :demands do |t|
      t.references :product
      t.references :cart

      t.timestamps
    end
    add_index :demands, :product_id
    add_index :demands, :cart_id
  end
end
