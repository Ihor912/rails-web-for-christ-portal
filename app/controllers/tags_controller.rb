class TagsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :get_tag, only: [:show, :edit, :update, :destroy]
  def new
  	@tag = Tag.new
  end

  def index
  	@tags = Tag.all
  end

  def show
  	@tags = Tag.all
    @articles = @tag.articles
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Тег успішно створений!"
      redirect_to tags_path
    else
      flash[:alert] = @tag.errors.full_messages
      render 'new'
    end 		
  end

  def edit
  end

  def update    
    if @tag.update_attributes(tag_params)
      redirect_to tags_path
    else
      render 'edit'
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_path
  end

  private
  def get_tag
    @tag = Tag.find_by(link_name: params['link_name'])
  end

  def tag_params
  	params.require(:tag).permit(:name, :link_name)
  end
end
