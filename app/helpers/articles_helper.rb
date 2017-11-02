module ArticlesHelper
    def get_author_name_from_article(article)
      unless article.user_id
        return ''
      end
  
      user = User.find(article.user_id)
      user.email.split('@')[0].capitalize
    end
end