class Site::OrdersController < SiteController

  def index


    @client_orders = []
    current_client.orders.each do |order|
      @client_orders << order
    end


    # @client_products = []
    # @client_orders.each do |product|
    #   @client_orders << product
    # end


  end

  def show

  end

  def new
    if has_products
      # create order
      @final_order = Order.new
      #set sold value from cart products to order
      set_itens_sold(current_client.cart.products)
      #remove products solds from other clients cart
      drop_itens_other_carts(current_client.cart.products)
      #set_order
      @final_order.products = current_client.cart.products
      @final_order.client = current_client
      if  @final_order.save
        clear_cart(current_client.cart)
        redirect_to site_home_path, notice: "O Pedido (#{@final_order.id}) foi computado com sucesso"
      else
        redirect_to request.referrer, alert: "O pedido (#{@final_order.id}) falhou"
      end
    else
      redirect_to request.referrer, alert: "Carrinho Vazio!!!"
    end
  end

  private

  def has_products
    current_client.cart.products.present?
  end

  def set_itens_sold(products)
    products.each do |p|
      p.sold = true
    end
  end

  def drop_itens_other_carts(products)
    Cart.all.reject{|c| c == current_client.cart }.each do |cart|
      cart.products = cart.products - products
    end
  end

  def clear_cart(cart)
    current_client.cart.products.clear
  end

end
