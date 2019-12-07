class Site::OrdersController < SiteController

  def index
    @client_orders = current_client.orders
  end

  def show

  end

  def new
    if has_products
      # create order
      @final_order = Order.new
      #set sold value from cart products to order
      current_client.cart.products.collect { |p| p.sold = true }
      #remove itens from other carts
      drop_itens(current_client.cart.products)
      #set_order
      @final_order.products = current_client.cart.products
      @final_order.client = current_client
      if  @final_order.save
        #clear current_user cart
        current_client.cart.products.clear
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

  def drop_itens(products)
    Cart.all.reject{|c| c == current_client.cart }.each do |cart|
      cart.products = cart.products - products
    end
  end

end
