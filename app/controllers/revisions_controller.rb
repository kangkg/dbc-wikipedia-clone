class RevisionsController < ApplicationController
  def index
    @article =  Article.find(params[:article_id])
    @revisions =@article.revisions
    @current_revision = @revisions.last
    @original = @revisions.reverse.last
  end

  def new
    article = Article.find(params[:article_id])
    redirect_to article if !logged_in?
    if !article.revisions.empty?
      @previous_revision = article.revisions.last
    end
  end

  def create
    redirect_to article if !logged_in?
    @article = Article.find(params[:article_id])

    @revision = Revision.new(revision_params)
    @revision.editor_id = current_user.id
    @revision.article_id = @article.id
    @revision.previous_revision_id = @article.revisions.ids.last

    if @revision.save
      redirect_to @article
    else
      @errors = @revision.errors.full_messages
      render "new"
    end
  end

  def show
    @article = Article.find(params[:article_id])
    @last_revision = Revision.find(params[:id])
    render "/articles/show"
  end

  private

  def revision_params
    params.require(:revision).permit(:body)
  end
end
