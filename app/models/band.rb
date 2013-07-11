class Band < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :albums
  has_many :tracks, through: :albums
end
