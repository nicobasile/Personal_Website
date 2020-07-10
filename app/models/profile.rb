class Profile < ActiveRecord::Base
  belongs_to :user
  has_attached_file :avatar, 
                    :styles => { medium: "300x300>", thumb: "100x100>" }, 
                    :default_url => "https://images.squarespace-cdn.com/content/54b7b93ce4b0a3e130d5d232/1519987165674-QZAGZHQWHWV8OXFW6KRT/icon.png?content-type=image%2Fpng"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end