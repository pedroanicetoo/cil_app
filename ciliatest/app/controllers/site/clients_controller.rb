class Site::ClientsController < SiteController
  before_filter :authenticate_client!
  def index
    @clients = Client.all
  end


end
