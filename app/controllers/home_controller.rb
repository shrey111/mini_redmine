class HomeController < ApplicationController
	  
  def dashboard
    @count = Project.count  
  end

end
