class AddDefaultTags < ActiveRecord::Migration[5.1]
  def change
  	Tag.create(name: "Бог", link_name: "God")
  	Tag.create(name: "Проблеми", link_name: "problems")
  	Tag.create(name: "Сенс життя", link_name: "meaningoflife")
  	Tag.create(name: "Існування", link_name: "existence")
  	Tag.create(name: "Ісус", link_name: "Jesus")
  	Tag.create(name: "Любов", link_name: "Love")
  	Tag.create(name: "Еволюція", link_name: "evolution")
  	Tag.create(name: "Вічне життя", link_name: "Eternallife")
  end
end
