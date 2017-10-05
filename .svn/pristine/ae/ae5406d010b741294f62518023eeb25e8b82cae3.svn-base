class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.references :user
      t.boolean :published
      t.datetime :published_at
      t.boolean :sticky

      t.timestamps
    end
    add_index :posts, :user_id
  end
end
