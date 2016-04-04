class User < ActiveRecord::Base
  has_many :actions
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :socialuname, presence: true
  validates :socialpwd, presence: true
end
