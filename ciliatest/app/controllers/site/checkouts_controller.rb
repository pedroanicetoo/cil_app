class Site::CheckoutsController < SiteController
  def index
    if current_client.cart.products.present? && current_client.cart.products.selling_products.present?
      @order_products = current_client.cart.products
    end
  end

end
