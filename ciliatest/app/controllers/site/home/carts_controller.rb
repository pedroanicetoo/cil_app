class Site::Home::CartsController < Site::HomeController
  before_filter :set_product, :only => [:edit, :update, :destroy]

  def index

  end

  def new

  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:id])
  end

end
