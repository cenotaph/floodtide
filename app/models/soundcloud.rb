class Soundcloud < ActiveRecord::Base
  belongs_to :event
 #attr_accessible :codenumber, :published, :title, :event_id
  validates_presence_of :codenumber
end
