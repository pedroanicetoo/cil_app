class Site::HomeController < SiteController
  before_filter :authenticate_client!
  def index
    # @products = Product.descending_order(10)
    @products = Product.paginate(:page => params[:page], :per_page => 6).by_name(params[:term])

    unless current_client.cart.nil?
      @products_on_cart = current_client.cart.products
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

end
