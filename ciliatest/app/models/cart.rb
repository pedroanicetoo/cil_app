class Cart < ActiveRecord::Base

  belongs_to :client
  has_many :cart_products
  has_many :products, through: :cart_products

  attr_accessible :products_attributes,
                  :client_attributes
end
