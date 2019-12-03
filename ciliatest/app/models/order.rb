class Order < ActiveRecord::Base

  has_one :client
  has_many :products

  attr_accessible :client_attributes,
                  :products_attributes
end
