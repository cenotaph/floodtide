class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :subtitle
      t.text :body
      t.boolean :published
      t.string :slug
      t.string :carousel
      t.timestamps
    end
    execute('INSERT INTO pages (title, body, published, slug) VALUES ("About", "Add text here", true, "about")')
  end
end
