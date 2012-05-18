# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery    
  
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Du måste logga in för att se detta"
    redirect_to root_url
  end
  
end
