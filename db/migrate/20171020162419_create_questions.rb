class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :text
      t.text :answer
      t.boolean :isPrivate
      t.string :author
      t.string :email
      t.string :respondent_id
      t.numeric :likes

      t.timestamps
    end
  end
end
