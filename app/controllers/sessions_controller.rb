class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id  #Agrega el ID del usuario autenticado para identificar su inicio de sesion
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Something was wrong with your loggin information"
      render 'new'
    end
  end
  
  def destroy
    if session[:user_id]
      session[:user_id] = nil
      flash[:success] = "You have successfully logged out"
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  
end