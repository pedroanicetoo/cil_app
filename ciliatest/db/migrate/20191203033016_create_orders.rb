class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :client

      t.timestamps
    end
  end
end
