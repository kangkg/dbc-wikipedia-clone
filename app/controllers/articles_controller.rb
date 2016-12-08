class ArticlesController < ApplicationController

  def index
    @articles = Article.search(params[:search])
  end

  def new
    @article = Article.new
  end

  def create
    if logged_in?
      @article = Article.new(article_params)
      @article.author_id = current_user.id
      if @article.save
        redirect_to @article
      else
        @errors = @article.errors.full_messages
        render "new"
      end
    end
  end

  def show
    @article = Article.find(params[:id])
    @author = @article.author.username
    @last_revision = @article.revisions.last
    if @article.status == "unpublished"
      render :file => 'public/403.html', :status => 403, :layout => false
    end
  end

  def update
    p "hey"
    @article = Article.find(params[:id])
    # @article.featured = true
    respond_to do |format|
        format.js {render :layout => false}
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if current_user && current_user.role == "admin"
      @article.destroy
      redirect_to articles_path
    else
      redirect_to @article
    end
  end

  private

  def article_params
    params.require(:article).permit(:title)
  end


end
