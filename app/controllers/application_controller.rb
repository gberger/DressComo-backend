class ApplicationController < ActionController::API
  respond_to :json
  include ActionController::ImplicitRender

  acts_as_token_authentication_handler_for User

  rescue_from Exception do |e|
    error(e)
  end

  def routing_error
    raise ActionController::RoutingError.new(params[:path])
  end

protected

  def error(e, status = 500)
    error_info = {
      error: "internal_server_error",
      exception: "#{e.class.name} : #{e.message}",
      status: status
    }
    if Rails.env.development? and not e.backtrace.nil?
      error_info[:trace] = e.backtrace[0,10]
    end

    render json: error_info, :status => 500
  end

  before_filter :always_json
  def always_json
    params[:format] = "json"
  end

  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)        { |u| u.permit(:email, :password, :username, :name, :location, :bio) }
    devise_parameter_sanitizer.for(:sign_in)        { |u| u.permit(:email, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :username, :name, :location, :bio, :password_confirmation, :current_password, ) }
  end
end
