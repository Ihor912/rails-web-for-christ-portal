class CreateJoinTableTagArticle < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tags, :articles do |t|
    	t.index [:tag_id, :article_id]
    end
  end
end
