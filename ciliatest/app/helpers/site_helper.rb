module SiteHelper

  def products_on_cart
    unless current_client.cart.nil?
      @products_on_cart = current_client.cart.products
    end
  end

  def cart_count
    @cart_count = (current_client.cart.cart_products).count
  end

end
