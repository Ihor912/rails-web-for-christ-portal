class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_if_its_not_admin?, only: [:edit, :destroy]
  before_action :get_article, only: [:show, :edit, :update, :destroy, :article_popularity_rate]
  helper_method :sort_direction

  def index
    @page = (params[:page] || 0).to_i
    if params[:query]
      @articles = Article.full_text_search(params[:query]).offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
    else
      condition = params[:filter] ? params[:filter].keys.join + ' ' + params[:filter].values.join : 'created_at'
      @articles = Article.all.order(condition).offset(PAGE_SIZE * @page).limit(PAGE_SIZE)  
    end
    @tags = Tag.all
    @popular_articles = Article.all.most_popular
    @meta_description = 'Істина Пізнати Істину Знайти Істину Сенс Життя'
  end

  def new
    @article = Article.new
  end
  
  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      flash[:notice] = "Стаття успішно опублікована!"
      redirect_to root_path
    else
      flash[:alert] = @article.errors.full_messages
      render 'new'
    end 		
  end

  def show
    article_popularity_rate
    @meta_title = "#{@article.title} - #{@root_meta_title}"
  end

  def edit
  end

  def update
    if @article.update_attributes(article_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  def sort_by_date
    @articles = Article.all.order('created_at DESC')
  end

  def sort_by_popularity
    @articles = Article.all.most_popular
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :user_id, :views, :link_name, :image, :tag_ids => [])
  end

  def get_article
    @article = Article.find_by(link_name: params['link_name'])
  end

  def article_popularity_rate
    new_view_count = @article.views.to_i + 1;
    @article.update(views: new_view_count)
  end

  def check_if_its_not_admin?
    if user_signed_in? && current_user.admin
      true
    else
      flash[:alert] = "Будь-ласка ввійдіть під своїм логіном"
      redirect_to new_user_session_path
    end
  end

  def sort_direction
    params[:filter] ? params[:filter].values.join : 'asc'
  end

end
