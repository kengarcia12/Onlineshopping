class Category < ActiveRecord::Base
  mount_uploader :picture, AvatarUploader
  has_many :products
end
