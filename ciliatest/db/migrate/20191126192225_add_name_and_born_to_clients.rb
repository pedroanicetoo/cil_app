class AddNameAndBornToClients < ActiveRecord::Migration
  def change
    add_column :clients, :name, :string
    add_column :clients, :born, :date
  end
end
