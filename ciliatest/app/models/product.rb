class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }

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



  # example
  # scope :descending_order, -> (quantity = 10) { limit(quantity).order(created_at: :desc) }

  # gem money-rails
  monetize :price_cents

  attr_accessible :description, :name, :price, :price_cents
end
