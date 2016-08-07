class ApplicationController < ActionController::Base
  before_filter :authenticate_user! 
  protect_from_forgery

  
#def after_sign_in_path_for(csfdklsj)
#redirect_to home_dashboard_path
#end




end
