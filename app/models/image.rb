class Image < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true
  # attr_accessible :attachable_id, :attachable_type, :caption, :imagefile
  mount_uploader :imagefile, ImageUploader

end
