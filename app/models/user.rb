class User < ActiveRecord::Base
  has_many :actions
  validates :email, uniqueness: true
  validates :email, presence: true
end
