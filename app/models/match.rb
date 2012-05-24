class Match < ActiveRecord::Base
  
  belongs_to :season, :foreign_key => "season_id"
  has_many :goals #many goals in a match
  has_many :players, :through => :match_assignments#, :source => :player_id
  has_many :match_assignments , :dependent => :destroy
  
  validates_presence_of :other_team, :message => "Fyll i match"   
  validates_presence_of :datum, :message => "Fyll i datum" 
  
  accepts_nested_attributes_for :goals, :allow_destroy => true
  
  def name     
     # Namnet på en match är motståndarlaget och datumet då matchen äger rum    
    self.other_team + self.datum.strftime(" %d/%m")
  end
end
