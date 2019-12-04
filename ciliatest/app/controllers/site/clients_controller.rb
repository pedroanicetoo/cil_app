class Site::ClientsController < SiteController
  def index
    @clients = Client.all
  end

end
