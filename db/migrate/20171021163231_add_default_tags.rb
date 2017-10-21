class AddDefaultTags < ActiveRecord::Migration[5.1]
  def change
  	Tag.create(name: "Новини", link_name: "news")
  	Tag.create(name: "Для Молоді", link_name: "for_youth")
  end
end
