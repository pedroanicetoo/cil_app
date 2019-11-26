class HomeController < ApplicationController
  before_filter :authenticate_client!
  def index
    @home = "deu certo, tela inicial"
  end
end
