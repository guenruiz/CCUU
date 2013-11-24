class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate(params[:username],params[:password])

  	if user
  		session[:user_id] = user.id
  		redirect_to root_url, :notice => "Bienvenido #{user.first_name}"
  	else
  		flash.now.alert = 'Usuario y/o contraseña incorrectos'
  		render "new"
  	end
  end

  def delete
    u = User.find(session[:user_id])
    session[:user_id] = nil
	  redirect_to root_url, :notice => "Hasta luego #{u.first_name}!"
  end
end
