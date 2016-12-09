class WelcomeController < ApplicationController

  def index
    @featured_article = Article.find_by(featured: true)
    if @featured_article
      @last_revision = @featured_article.revisions.last
    end
  end

end
