class HomeController < ApplicationController
	before_filter :authenticate_user!
  
  def dashboard
    @count = Project.count  
  end

end
