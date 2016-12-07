class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.author_id = current_user.id
    if @article.save
      redirect_to @article
    else
      @errors = @article.errors.full_messages
      render "new"
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title)
  end


end
