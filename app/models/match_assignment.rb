class MatchAssignment < ActiveRecord::Base
  belongs_to :match, :class_name => "Match", :foreign_key => "match_id"
  belongs_to :player, :class_name => "Player", :foreign_key => "player_id"
#  belongs_to :match
#  belongs_to :player
  
end
