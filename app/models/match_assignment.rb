class MatchAssignment < ActiveRecord::Base
  belongs_to :match, :class_name => "Match", :foreign_key => "match_id"
  belongs_to :player, :class_name => "Player", :foreign_key => "player_id"
  
  def is_confirmed
    if self.confirmed 
      "Ja"
    elsif self.confirmed == nil
      "Inte svarat"
    else
      "Nej"
    end
  end
end
