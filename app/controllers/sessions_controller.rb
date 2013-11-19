class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate(params[:username],params[:password])

  	if user
  		session[:user_id] = user.id
  		redirect_to root_url, :notice => 'Sesión iniciada correctamente'
	else
		flash.now.alert = 'Usuario y/o contraseña incorrectos'
		render "new"
	end
  end

  def delete
  	session[:user_id] = nil
  	flash[:notice] = "Hasta pronto"
	 redirect_to root_url
  end
end
