# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  
  # Skyddar formulär från Cross-site Request Forgery (CSRF) attacks
  protect_from_forgery    
  
  # Om cancan anser att man inte har rättigheter så skickas man vidre till roten (förstasidan)
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Du måste logga in för att se detta"
    redirect_to root_url
  end
  
end
