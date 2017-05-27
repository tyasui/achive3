class Contribution < ActiveRecord::Base
    validates :content, length: { in: 1..140 }
    default_scope -> { order(created_at: :desc) }
    
    belongs_to :user
    
    mount_uploader :picture, PictureUploader

end
