class TagsController < ApplicationController
  def show
    @tag = Tag.find_by(link_name: params['link_name'])
  	@tags = Tag.all
    @articles = @tag.articles
  end
end
