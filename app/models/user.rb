class User < ActiveRecord::Base
  attr_accessible :email, :password, :token

  validates :email, :password, presence: true
  validates :email, uniqueness: true

  has_many :notes
end