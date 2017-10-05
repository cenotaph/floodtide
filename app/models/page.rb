class Page < ActiveRecord::Base

  has_many :images, :as => :attachable
  accepts_nested_attributes_for :images, :allow_destroy => true
  extend FriendlyId
  friendly_id :title, use: :slugged  
  mount_uploader :carousel, ImageUploader
  mount_uploader :page_icon, ImageUploader
end
