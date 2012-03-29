class HomeController < ApplicationController
  def index
    # Creating a new token to the user
    token = Digest::MD5.hexdigest(Time.now.to_s)
    
    # Adding the token to the session
    session[:token] ||= token
    
    # Appending the token to the bindings array
    $bindings[token] = Output.new.send(:binding)
  end
  
  def command
    begin
      render :text => eval(%Q{#{params[:command]}}, $bindings[session[:token]])
    rescue Exception => e
      render :text => e.to_s.gsub(/#<HomeController:(.)*>/, "main:Object")
    end
  end
end


