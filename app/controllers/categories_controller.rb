class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path
    else
      @errors = @category.errors.full_messages
      render root_path
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    #
  end

end
