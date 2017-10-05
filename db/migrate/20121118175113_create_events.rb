class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :when
      t.string :weblink1
      t.string :weblink2
      t.text :description
      t.boolean :published
      t.string :slug
      t.timestamps
    end
  end
end
