class Event < ActiveRecord::Base

  has_many :images, :as => :attachable
  has_many :soundclouds
  has_many :videos
  accepts_nested_attributes_for :images, :allow_destroy => true
  accepts_nested_attributes_for :soundclouds, :allow_destroy => true
  accepts_nested_attributes_for :videos, :allow_destroy => true
  validates_presence_of :when
  extend FriendlyId
  friendly_id :title, use: :slugged  

  scope :published, -> () { where(:published => true) }
  scope :future, -> () {where(['events.when >= ?', Time.now.to_date]).where(:published => true) }
  scope :past, -> () {where(:published => true).where(['events.when < ?', Time.now.to_date]).order('events.when DESC') }

  def subtitle_display
    subtitle.blank? ? (hidedate == true ? hide_text : self.when.strftime('%B %d, %Y')) : subtitle
  end

end
