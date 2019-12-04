class SiteController < ApplicationController
  before_filter :authenticate_client!
  layout "site"
end
