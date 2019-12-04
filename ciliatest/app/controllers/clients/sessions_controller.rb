class Clients::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]
  before_filter :create_cart, :only => [:create]
  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
    #create buy-cart
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end


  private

  def create_cart
    unless current_client.cart.present?
      @cart = Cart.new(params[:cart])
      if @cart.save
        current_client.cart = @cart
        redirect_to root_path, notice: "Carrinho do (#{@current_client.name}) foi cadastrado com sucesso"
      else
        render :new
      end
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
