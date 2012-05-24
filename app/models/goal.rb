class Goal < ActiveRecord::Base
  belongs_to :match # a goal is only made in ONE match
  
  # Ett mål tillhör en målgörare och en framspelare  
  belongs_to :player, :class_name => "Player", :foreign_key => "goaler_id"
  belongs_to :player, :class_name => "Player", :foreign_key => "assister_id"
  
end
