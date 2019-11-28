class Site::HomeController < SiteController
  before_filter :authenticate_client!
  def index
    @distinct_names = Product.select_distinct_name
  end

end
