class Note < ActiveRecord::Base
  attr_accessible :user_id, :track_id, :contents

  belongs_to :track, dependent: :destroy
  belongs_to :user, dependent: :destroy
end