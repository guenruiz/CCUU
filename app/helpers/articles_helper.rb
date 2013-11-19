module ArticlesHelper

  def setup_article(article)
    2.times { article.sources.build }
    article
  end

end
