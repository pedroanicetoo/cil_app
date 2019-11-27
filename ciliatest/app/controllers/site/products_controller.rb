class Site::ProductsController < SiteController
  before_filter :authenticate_client!
  def index
    @products = Product.all
  end
end
