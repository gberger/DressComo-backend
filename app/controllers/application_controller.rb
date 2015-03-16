class ApplicationController < ActionController::API
  respond_to :json
  include ActionController::ImplicitRender

  acts_as_token_authentication_handler_for User
end
