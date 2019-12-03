class Cart < ActiveRecord::Base

  belongs_to :client
  has_many :products

  attr_accessible :products_attributes,
                  :client
end
