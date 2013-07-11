class Album < ActiveRecord::Base
  attr_accessible :band_id, :name

  belongs_to :band, dependent: :destroy
end
