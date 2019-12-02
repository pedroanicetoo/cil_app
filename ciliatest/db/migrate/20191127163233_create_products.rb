class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.belongs_to :order

      t.timestamps
    end
  end
end
