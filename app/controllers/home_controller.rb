class HomeController < ApplicationController
  def index
    session[:binding] = Output.new.send(:binding).to_msgpack 
  end
  
  def command
   begin
    render :text => eval(%Q{#{params[:command]}}, MessagePack.unpack(session[:binding]))
   rescue Exception => e
    render :text => e
   end
  end
end

    
z=1
x=20
y=x+z
(1..3).each do |t|
  p t
end
puts "yes"
