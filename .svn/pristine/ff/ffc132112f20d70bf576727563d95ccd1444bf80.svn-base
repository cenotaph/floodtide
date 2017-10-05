class AddThumbnailToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :video_width, :integer
    add_column :videos, :video_height, :integer
    add_column :videos, :thumbnail, :string
    add_column :videos, :thumbnail_size, :integer
    add_column :videos, :thumbnail_content_type, :string
    add_column :videos, :thumbnail_width, :integer
    add_column :videos, :thumbnail_height, :integer
    add_column :videos, :for_archive, :boolean
    add_column :videos, :duration, :integer
    add_column :videos, :description, :text
  end
end
