class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  def index
    render json: Article.all
  end

  # GET /articles/:id
  # GET /articles/:id.json
  def show
    render json: Article.find(params[:id])
  end
end
