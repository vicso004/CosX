class Player < ActiveRecord::Base
	has_one :user
  has_and_belongs_to_many :matches ## a player participates in many matches
  has_many :matches, :through => :match_assignments#, :source => :match_id
  has_many :match_assignments
  has_many :Goals, :class_name => "Goal", :foreign_key => "goaler_id"
  has_many :Goals, :class_name => "Goal", :foreign_key => "assister_id"              
  
  validates_presence_of :name, :message => "Fyll i namn"
  
#  MatchAssignment


def made_goals

  Goal.where(:goaler_id => self.id).length
end

def made_assists
  Goal.where(:assister_id => self.id).length
end
end
