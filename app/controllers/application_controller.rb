class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end
end
