class AddIndexToArticlesLinkName < ActiveRecord::Migration[5.1]
  def change
  	add_index :articles, :link_name, unique: true
  end
end
