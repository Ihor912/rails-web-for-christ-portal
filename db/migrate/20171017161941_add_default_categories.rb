class AddDefaultCategories < ActiveRecord::Migration[5.1]
  def change
  	Category.create(name: 'Test1')
  	Category.create(name: 'Test2')
  end
end
