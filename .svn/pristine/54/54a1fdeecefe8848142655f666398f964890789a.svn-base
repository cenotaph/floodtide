class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.integer :codenumber, :limit => 8
      t.references :event
      t.boolean :published

      t.timestamps
    end
    add_index :videos, :event_id
  end
end
