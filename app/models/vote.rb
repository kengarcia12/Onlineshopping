class Vote < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  validates_uniqueness_of :product_id, scope: :user_id
end