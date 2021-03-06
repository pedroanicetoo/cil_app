class Site::HomeController < SiteController

  def index
    # @products = Product.descending_order(10)
    @products = products_show(6, params[:term])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  private
    def products_show(page_qtd, params_search)
      @show = Product.paginate(:page => params[:page], :per_page => page_qtd)
                     .find_by_name(params_search).selling_products
    end

end
