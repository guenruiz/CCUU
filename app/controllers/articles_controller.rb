class ArticlesController < ApplicationController
  def index
    @posts = Article.all
    render :json => @posts 
  end
  
  def show
    @post = Article.find(params[:id])
    render :json => @post 
  end
  
end
