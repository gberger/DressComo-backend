class ErrorsController < ApplicationController
  def routing
    error(ActionController::RoutingError.new("No route matches [#{request.method}] #{request.path}"), 404)
  end
end