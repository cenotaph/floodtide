class Post < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :body, :title
  extend FriendlyId
  friendly_id :title, use: :slugged 
  before_save :check_published_date
  has_many :comments
  
  scope :published, -> { where(published: true) }
  
  def check_published_date
    if self.published == true
      self.published_at ||= Time.now
    end    
  end
  
  def name
    title
  end
  
end
