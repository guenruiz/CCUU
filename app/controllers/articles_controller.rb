class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_filter :check_author, only: [:edit, :update, :destroy]
  before_filter :login_required, :only => [:new]

  # GET /articles
  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
      format.json { render :json => @articles }
    end

  end


  # GET /articles/1
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
      format.json { render :json => @article }
    end
  end

  # GET /articles/new
  def new
    @article = Article.new
    3.times do
      @article.sources.build
      @article.art_objects.build
    end
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    @user = User.find(session[:user_id])
    logger.debug "Todos: #{article_params}"
    @article.user = @user
    if @article.save
      respond_to do |format|
        format.html { redirect_to @article, notice: 'Artículo creado correctamente'}
      end
      
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Artículo Actualizado'
    else
      render action: 'edit'
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Artículo eliminado'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:id, :title, :body, :photo, 
                     :sources_attributes => [:id, :name, :url, :description,:created_at, :updated_at, :article_id, :_destroy],
                     :art_objects_attributes => [:id, :name, :route, :description,:created_at, :updated_at, :article_id, :_destroy])
    end

    def check_author
      if session[:user_id] != @article.user_id
        redirect_to articles_path,:notice => "Solo puedes editar lo que tu hallas escrito!"
      end 
    end

    def login_required
      if session[:user_id] == nil
        flash[:error] = "Necesitas Iniciar sesión!"
        redirect_to login_path
      end
    end

end
