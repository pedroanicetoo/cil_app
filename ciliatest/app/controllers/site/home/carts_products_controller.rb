class Site::Home::CartsProductsController < Site::HomeController
  before_filter :set_cart_product_new, :only => [:edit, :update, :destroy]

  def new

  end

  def create

  end

  def edit
    #set_cart_product via before_filter
    if @cart_product.update_attributes(params[:cart_product])
      redirect_to request.referrer, notice: "O Produto (#{@cart_product.product.name}) foi adicionado ao carrinho com sucesso"
    else
      redirect_to request.referrer, notice: "Falha ao adicionar (#{@cart_product.product.name}) ao carrinho"
    end
  end

  def destroy
    #set_cart_product via before_filter
    @cart_product = current_client.cart.cart_products.where(product_id: params[:id])
    @cart_product[0].destroy
    respond_to do |format|
      format.html {
        redirect_to request.referrer, notice: "Produto (#{@cart_product[0].product.name}) excluido do carrinho"
      }
      format.json {
        head :no_content
      }
    end

  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cart_product_new
    @cart_product = CartProduct.new
    @cart_product.cart = current_client.cart
    @cart_product.product = Product.find(params[:id])
  end
end
