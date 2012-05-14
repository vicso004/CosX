class Goal < ActiveRecord::Base
  belongs_to :match # a goal is only made in a match
  
  belongs_to :player, :class_name => "Player", :foreign_key => "goaler_id"
  belongs_to :player, :class_name => "Player", :foreign_key => "assister_id"
  
end
