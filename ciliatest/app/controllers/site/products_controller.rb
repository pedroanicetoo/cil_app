class Site::ProductsController < SiteController
  before_filter :authenticate_client!
  before_filter :set_product, :only => [:edit, :update, :destroy]
  def index
    # @products = Product.descending_order(10)

    @products = Product.paginate(:page => params[:page], :per_page => 10).by_name(params[:term])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(params[:product])

      if @product.save
        redirect_to site_products_path, notice: "O Produto (#{@product.name}) foi cadastrado com sucesso"
      else
        render :new
      end
    end

    def edit
      #set_product via before_filter
    end

    def update
      if @product.update_attributes(params[:product])
        redirect_to site_products_path, notice: "O Produto (#{@product.name}) foi atualizado com sucesso"
      else
        render :edit
      end
    end

    def destroy
      @product.destroy

      respond_to do |format|
        format.html {
          redirect_to site_products_path, notice: "Produto (#{@product.name}) excluido com sucesso!!"
        }
        format.json {
          head :no_content
        }
      end
    end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

end

