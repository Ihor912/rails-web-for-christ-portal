module ArticlesHelper
    def get_author_name_from_article(article)
      unless article.user_id
        return ''
      end
  
      user = User.find(article.user_id)
      user.email.split('@')[0].capitalize
    end

  def sortable(title, column, direction)
    direction = sort_direction == "asc" ? "desc" : "asc"
    link_to "#{title}", {:controller => "articles", :action => "index", :filter => {column => direction}}
  end
end