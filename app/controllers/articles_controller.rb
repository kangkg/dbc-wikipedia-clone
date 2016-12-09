class ArticlesController < ApplicationController

  def index
    @articles = Article.search(params[:search])
  end

  def new
    @article = Article.new
    # @sorted_article = SortedArticle.new
    @revision = Revision.new
  end

  def create
    if logged_in?
      @article = Article.new(article_params)
      @article.author = current_user

      desired_category = Category.find_or_create_by(category_params)

      # @article.sorted_articles << new_sorted_article

      if @article.save && desired_category.save # need revision to be created as well. order also matters here
        SortedArticle.create(category_id: desired_category.id, article_id: @article.id)
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
    if @article.status == "unpublished" && current_user.try('role') == 'user' && current_user != @article.author
      @article = nil
      @errors = ['This page is under construction!']
      render :show
    end
  end

  # && ( current_user.try('role') == 'user' || current_user != @article.author)

  def update
    @article = Article.find(params[:id])
    @article.featured = !@article.featured
    @article.save
    respond_to do |format|
      format.html { redirect_to @article }
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
    params_hash = params.require(:article).permit(:title)
    params_hash[:status] = 'unpublished'
    params_hash
  end

  def category_params
    category_hash = params.require(:article).require(:category).permit(:name)
    # => {name: 'your category title'}
  end


end
