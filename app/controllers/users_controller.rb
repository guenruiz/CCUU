class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :login_required, :only => [:index]
  # GET /users
  def index
    @users = User.all.order('first_name ASC')
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, success: 'Ahora estas registrado! Gracias :)'
    else
      render action: 'new', alert: 'Ocurrio algun problema al crear tu usuario :C'
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, success: 'User was successfully updated.'
    else
      render action: 'edit', alert: 'Ocurrio algun problema al crear tu usuario :C'
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'Haz dejado de ser parte de ColectivoCUU, Bon voyage'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :password, 
            :password_confirmation, :about_user, :email, :photo)
    end

    def login_required
      if session[:user_id] == nil
        flash[:error] = "Necesitas Iniciar sesión!"
        redirect_to login_path #, error: "Necesitas Iniciar sesión!"
      end
    end

end
