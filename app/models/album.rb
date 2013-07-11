class Album < ActiveRecord::Base
  attr_accessible :band_id, :name, :type

  validates :band_id, :name, :type, presence: true
  validates :name, uniqueness: {scope: :band_id}
  validates :type, inclusion: { in: ["live", "studio"] }

  belongs_to :band, dependent: :destroy

  has_many :tracks
end
