class Video < ActiveRecord::Base
  belongs_to :event

  before_save :populate_other_fields
  attr_accessor :in_url
  
  scope :published, -> {  where(published: true)  }
  scope :archive, -> { where(for_archive: true) }
    
  mount_uploader :thumbnail, ImageUploader
  
  attr_accessor :in_url
  
  def name
    title
  end
  
  def populate_other_fields
    if in_url =~ /vimeo/
      logger.warn 'dhdfh'
      self.codenumber = in_url.match(/^\D*\/(\d*).*/)[1] || 'error'
      v = Vimeo::Simple::Video.info(codenumber).first
      self.title = v['title']
      self.description = v['description']
      self.remote_thumbnail_url = v['thumbnail_large']
      self.video_width = v['width']
      self.video_height = v['height']
      self.duration = v['duration']
    end
    if thumbnail.present?
      self.thumbnail_content_type = thumbnail.file.content_type
      self.thumbnail_size = thumbnail.file.size
      self.thumbnail_width, self.thumbnail_height = `identify -format "%wx%h" #{thumbnail.file.path}`.split(/x/)
    end
    if codenumber == 'error' || codenumber.blank?
      errors.add(:codenumber, "Could not load video with this URL")
    end
  end
  
  def url
    "http://vimeo.com/#{codenumber}"
  end
  
  
end
