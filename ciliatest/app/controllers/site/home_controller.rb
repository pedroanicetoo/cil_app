class Site::HomeController < SiteController
  before_filter :authenticate_client!
  def index
    @home = "SEJA BEM VINDO !!!"
  end
end
