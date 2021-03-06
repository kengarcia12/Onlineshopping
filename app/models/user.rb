class User < ActiveRecord::Base
  has_many :votes, dependent: :destroy
  has_many :upvoted_products, through: :votes, source: :product
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
