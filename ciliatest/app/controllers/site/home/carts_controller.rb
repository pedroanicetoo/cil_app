class Site::Home::CartsController < Site::HomeController
  before_filter :set_product, :only => [:edit, :update, :destroy]

  def index

  end

  def new

  end

end
