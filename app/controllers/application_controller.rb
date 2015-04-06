class ApplicationController < ActionController::API
  respond_to :json
  include ActionController::ImplicitRender

  acts_as_token_authentication_handler_for User

  before_filter :always_json
  before_action :configure_permitted_parameters, if: :devise_controller?

protected

  def always_json
    params[:format] = "json"
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)        { |u| u.permit(:email, :password, :username, :name, :location, :bio) }
    devise_parameter_sanitizer.for(:sign_in)        { |u| u.permit(:email, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :username, :name, :location, :bio, :password_confirmation, :current_password, ) }
  end
end
