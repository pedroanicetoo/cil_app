class CartProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  attr_accessible :product_attributes, :cart_attributes
end
