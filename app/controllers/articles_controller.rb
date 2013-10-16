class ArticlesController < ApplicationController
  def index
    @posts = Article.all
    render :json => @posts 
  end
  #public void index(){
  #   List<Article> articulos = Articulos.findAll();
  #   renderJson(articulos);
  #}
  def show
    @post = Article.find(params[:id])
    render :json => @post 
  end
  
  def save_article
    
  end

end
