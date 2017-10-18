class ArticlesController < ApplicationController
  before_action :get_article, only: [:show, :edit, :update, :destroy, :article_popularity_rate]
  def index
  	@articles = Article.all.order('created_at DESC').is_moderated
  	@article = Article.new
    @category = Category.first
    @categories = Category.all
    @popular_articles = Article.all.is_moderated.most_popular
  end

  def new
    @article = Article.new
    @category = Category.first
    @categories = Category.all
  end
  
  def create
    @article=Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render 'new'
    end 		
  end

  def show
    @category = Category.find(@article.category_id)
    article_popularity_rate
  end

  def edit
    @category = Category.find(@article.category_id)
    @categories = Category.all
  end

  def update
    if @article.update_attributes(article_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(@article.category_id)
    @article.destroy
    redirect_to root_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :user_id, :moderated, :category_id, :views)
  end

  def get_article
    @article = Article.find(params[:id])
  end

  def article_popularity_rate
    new_view_count = @article.views.to_i + 1;
    @article.update(views: new_view_count)
  end
end
