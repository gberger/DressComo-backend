class ApplicationController < ActionController::API
  respond_to :json
  include ActionController::ImplicitRender
end
