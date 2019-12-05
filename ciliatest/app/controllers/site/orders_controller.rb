class Site::OrdersController < SiteController

  def index

  end

  def show

  end

  def new

    if has_products
      # create order
      @final_order = Order.new
      #set sold value from cart products to order
      set_sold_products(current_client.cart.products)
      #remove products solds from other clients cart
      remove_products_carts(current_client.cart.products)
      #include products sold on cart
      @final_order.products = current_client.cart.products

      if  @final_order.save
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

  def set_sold_products(products)
    products.each do |p|
      p.sold = true
    end
  end

  def remove_products_carts(products)
    Client.all.reject{|c| c == current_client}.each do |client|
      client.cart.products = client.cart.products - products
    end
  end

end
