class Site::OrdersController < SiteController

  def index

  end

  def show

  end

  def new

    if current_client.cart.products.present? && current_client.cart.products.selling_products.present?
      @final_order = Order.new
      @order_products = current_client.cart.products
    end

    # if @final_order.present?
    #   #set products from cart to order
    #   selling_products(@order_products)
    #   @final_order.products = @order_products
    #   if  @final_order.save
    #     redirect_to site_home_path, notice: "O Pedido (#{@final_order.id}) foi computado com sucesso"
    #   else
    #     redirect_to request.referrer, notice: "O pedido (#{@final_order.id}) falhou"
    #   end
    # end
  end

  private

  def selling_products(products)
    products.each do |p|
      p.sold = true
    end
  end

end
