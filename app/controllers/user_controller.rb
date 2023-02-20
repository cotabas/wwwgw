class UserController < ApplicationController
  helper_method :oc

  def oc 
    Streamer.find(6).update(disney: true)
  end  
  def show 
    @user = User.find(params[:id])
  end
end
