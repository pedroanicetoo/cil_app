class Product < ActiveRecord::Base

  belongs_to :order
  has_many :demands
  has_many :carts, through: :demands

  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }

  #paperclip
   has_attached_file :picture, styles: { large: "432x240#", medium: "320x150#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
   validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  #scopes
  #Listando x Produtos em ordem de criação
  scope :descending_order, -> (quantity = 10) { limit(quantity).order(created_at: :desc) }
  #Listando produtos do mais barato até o mais caro
  scope :descending_order_by_price, -> { order('id ASC').reorder('price_cents ASC') }
  #Retorna os objetos com nomes(categorias distintas)
  scope :select_distinct_name, -> { group(:name) }
  #seleciona apenas produtos com um nome(categoria)
  scope :select_all_products_name, -> ( name ) { where( name: name ) }
  #contando quanto produtos temos com o mesmo nome
  scope :count_all_products_name, -> ( name ) { where( name: name ).count }

  scope :by_name, -> ( name ) { where("name LIKE ?", "%#{name}%" ) }

  # example
  # scope :descending_order, -> (quantity = 10) { limit(quantity).order(created_at: :desc) }

  # gem money-rails
  monetize :price_cents

  attr_accessible :description,
                  :name,
                  :price,
                  :price_cents,
                  :picture,
                  :carts_attributes,
                  :orders_attributes
end
