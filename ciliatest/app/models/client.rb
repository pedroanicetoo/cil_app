class Client < ActiveRecord::Base

  has_one :cart
  has_many :orders
  has_many :products, :through => :orders

  #validates
  validates :name, :email, presence:true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email,
                  :password,
                  :password_confirmation,
                  :name,
                  :born,
                  :cart,
                  :orders,
                  :products_attributes
end
