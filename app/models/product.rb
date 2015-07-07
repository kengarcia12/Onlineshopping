class Product < ActiveRecord::Base
  mount_uploader :picture, AvatarUploader
  belongs_to :categories
end
