class Album < ActiveRecord::Base

  LOCATIONS = ["live", "studio"]

  attr_accessible :band_id, :name, :location

  validates :band_id, :name, :location, presence: true
  validates :name, uniqueness: {scope: :band_id}
  validates :location, inclusion: { in: LOCATIONS }

  belongs_to :band, dependent: :destroy

  has_many :tracks
end
