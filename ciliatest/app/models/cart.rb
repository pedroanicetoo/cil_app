class Cart < ActiveRecord::Base

  belongs_to :client
  has_many :demands
  has_many :products, through: :demands

  attr_accessible :products_attributes,
                  :client_attributes
end
