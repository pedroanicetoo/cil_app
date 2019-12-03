class Site::HomeController < SiteController
  before_filter :authenticate_client!
  def index
    # @products = Product.descending_order(10)
    @products = Product.paginate(:page => params[:page], :per_page => 6).by_name(params[:term])

    unless current_client.cart.nil?
      @cart_count = (current_client.cart.demands).count
      @products_on_cart = current_client.cart.products
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end


  private

  def create_cart
    @cart = Cart.new(params[:cart])
    if @cart.save
      current_client.cart = @cart
      redirect_to site_home_path, notice: "Carrinho do (#{@current_client.name}) foi cadastrado com sucesso"
    else
      render :new
    end
  end

end
