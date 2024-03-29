class Comment < ActiveRecord::Base
	
	has_attached_file :image, styles: { medium: "320x240#"}
  validates_attachment :image, 
                        content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                        size: { less_than: 5.megabytes }

  validates :name, presence: true
  validates :title, presence: true
	validates :message, presence: true
end
