class Product < ActiveRecord::Base
  mount_uploader :picture, AvatarUploader
  belongs_to :category
  delegate :category_name, to: :categories, prefix: true
  has_many :votes, dependent: :destroy
  has_many :upvoted_users, through: :votes, source: :user
  def self.search(search)
    where("product_name LIKE ?", "%#{search}%")
  end
end
