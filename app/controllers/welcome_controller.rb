class WelcomeController < ApplicationController

  def index
    @featured_article = Article.find_by(featured: true)
  end

end
