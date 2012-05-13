class Player < ActiveRecord::Base
	has_one :user
  has_and_belongs_to_many :matches ## a player participates in many matches
  has_many :matches, :through => :match_assignments#, :source => :match_id
  has_many :match_assignments
	validates :name, :presence => true
    
#  MatchAssignment
end
