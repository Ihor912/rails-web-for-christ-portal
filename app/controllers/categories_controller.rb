class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @category = Category.where(name: params['name']).first
    @categories = Category.all
    @articles = Article.where(category_id: @category.id).is_moderated
    @article = Article.new
  end
end
