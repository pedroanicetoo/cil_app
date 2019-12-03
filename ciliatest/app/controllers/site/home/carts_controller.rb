class Site::Home::CartsController < Site::HomeController
  before_filter :set_product, :only => [:edit, :update, :destroy]

  def index

  end

  def new
    @cart = Cart.new(params[:cart])
    if @cart.save
      current_client.cart = @cart
      redirect_to site_home_path, notice: "Carrinho do (#{@current_client.name}) foi cadastrado com sucesso"
    else
      render :new
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:id])
  end

end
