class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @articles = Article.where(category_id: @category.id)
    @article = Article.new
  end
end
