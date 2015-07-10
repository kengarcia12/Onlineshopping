class Product < ActiveRecord::Base
  mount_uploader :picture, AvatarUploader
  belongs_to :categories
  def self.search(search)
    where("product_name LIKE ?", "%#{search}%")
  end
end
