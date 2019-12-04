class Site::Home::DemandsController < Site::HomeController
  before_filter :set_demand_new, :only => [:edit, :update, :destroy]

  def new

  end

  def create

  end

  def edit
    #set_demand via before_filter
    if @demand.update_attributes(params[:demand])
      redirect_to site_home_path, notice: "O Produto (#{@demand.product.name}) foi adicionado ao carrinho com sucesso"
    else
      redirect_to site_home_path, notice: "Falha ao adicionar (#{@demand.product.name}) ao carrinho"
    end
  end

  def destroy
    #set_demand via before_filter
    @demand = current_client.cart.demands.where(product_id: params[:id])
    @demand[0].destroy
    respond_to do |format|
      format.html {
        redirect_to site_home_path, notice: "Produto (#{@demand[0].product.name}) excluido do carrinho"
      }
      format.json {
        head :no_content
      }
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def set_demand_new
    @demand = Demand.new
    @demand.cart = current_client.cart
    @demand.product = Product.find(params[:id])
  end

end
