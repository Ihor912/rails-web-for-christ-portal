class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.string :link_name

      t.timestamps
    end
  end
end
