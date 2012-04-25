class Goal < ActiveRecord::Base
  belongs_to :match # a goal is only made in a match
  
end
