class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_if_its_not_admin?, only: [:edit, :destroy]

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
    @article = current_user.articles.new(article_params)
    redirect_to root_path if @article.save		
  end

  def show
    @article = Article.find(params[:id])
    @category = Category.find(@article.category_id)
  end

  def edit
    @article = Article.find(params[:id])
    @category = Category.find(@article.category_id)
    @categories = Category.all
  end

  def update
    @article = Article.find(params[:id])
    redirect_to root_path if @article.update_attributes(article_params)
  end

  def destroy
    @article = Article.find(params[:id])
    @category = Category.find(@article.category_id)
    @article.destroy
    redirect_to root_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :user_id, :moderated, :category_id)
  end

  def check_if_its_not_admin?
    if user_signed_in? && current_user.admin
      true
    else
      flash[:alert] = "Будь-ласка ввійдіть під своїм логіном"
      redirect_to bike_routes_path
    end
  end

end
