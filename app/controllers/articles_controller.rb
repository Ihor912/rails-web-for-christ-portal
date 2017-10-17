class ArticlesController < ApplicationController
  def index
  	@articles = Article.all
  	@article = Article.new
    @category = Category.first
    @categories = Category.all
  end
  def new
    @article = Article.new
    @category = Category.first
    @categories = Category.all
  end
  
  def create
    @article=Article.new(article_params)
    redirect_to root_path if @article.save		
  end

  def show
    @article=Article.find(params[:id])
    @category = Category.find(@article.category_id)
  end
  def edit
    @article=Article.find(params[:id])
    @category = Category.find(@article.category_id)
    @categories = Category.all
  end

  def update
    @article=Article.find(params[:id])
    redirect_to root_path if @article.update_attributes(article_params)
  end

  def destroy
    @article=Article.find(params[:id])
    @category = Category.find(@article.category_id)
    @article.destroy
    redirect_to root_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :user_id, :moderated, :category_id)
  end

end
