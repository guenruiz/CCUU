class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    render json: User.all
  end

  # GET /users/:id
  # GET /users/:id.json
  def show
    render json: User.find(params[:id])
  end
end
