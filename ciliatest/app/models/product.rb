class Product < ActiveRecord::Base

  #validates
  validates :title, :description, presence:true
  validates :price, numericality: { greater_than: 0 }

  # gem money-rails
  monetize :price_cents

  attr_accessible :description, :name, :price

end
