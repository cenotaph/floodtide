class CreateSoundclouds < ActiveRecord::Migration
  def change
    create_table :soundclouds do |t|
      t.string :title
      t.string :codenumber
      t.references :event
      t.boolean :published

      t.timestamps
    end
    add_index :soundclouds, :event_id
  end
end
