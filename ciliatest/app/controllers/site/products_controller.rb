class Site::ProductsController < SiteController
  before_filter :authenticate_client!
  def index
    @products = Product.descending_order_by_price
  end
end
