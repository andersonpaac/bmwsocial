class User < ActiveRecord::Base
  has_many :actions
  has_many :messages
  has_many :posts
  validates :email, uniqueness: true
  validates :email, presence: true
end
