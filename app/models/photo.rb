class Photo < ActiveRecord::Base
  belongs_to :plant
  belongs_to :user
  validates :picture, presence: true

  mount_uploader :picture, PictureUploader

end
