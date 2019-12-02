class Order < ActiveRecord::Base

  belongs_to :client
  has_many :products


  attr_accessible :client_attributes,
                  :products_attributes
end
