class Track < ActiveRecord::Base
  attr_accessible :album_id, :name, :lyrics

  validates :album_id, :name, presence: true
  validates :name, uniqueness: {scope: :album_id}

  belongs_to :album, dependent: :destroy
  has_one :band, through: :album
  has_many :notes
end
