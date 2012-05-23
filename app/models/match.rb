class Match < ActiveRecord::Base
  
  belongs_to :season, :foreign_key => "season_id"
  has_many :goals #many goals in a match
  has_many :players, :through => :match_assignments#, :source => :player_id
  has_many :match_assignments , :dependent => :destroy
  
  validates_presence_of :other_team, :message => "Fyll i match"   
#  validates_numericality_of :score_other, :only_integer =>true, :greater_than_or_equal_to =>0, :message => "Antalet kan inte vara negativt"    
  
  accepts_nested_attributes_for :goals, :allow_destroy => true
  
  def name
    self.other_team + self.datum.strftime(" %d/%m")
  end
end
