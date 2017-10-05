class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :caption
      t.string :imagefile
      t.string :attachable_type
      t.integer :attachable_id

      t.timestamps
    end
  end
end
