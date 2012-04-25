class Match < ActiveRecord::Base
  belongs_to :season
  has_and_belongs_to_many :players ##many players participate in matches
  has_many :goals #many goals in a match
end
