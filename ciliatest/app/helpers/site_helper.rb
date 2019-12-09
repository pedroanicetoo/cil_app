module SiteHelper

  def products_on_cart
    unless current_client.cart.nil?
      @cart_count = (current_client.cart.cart_products).count
      @products_on_cart = current_client.cart.products
    end
  end

end
