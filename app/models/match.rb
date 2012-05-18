class Match < ActiveRecord::Base
  belongs_to :season
  has_many :goals #many goals in a match
  has_many :players, :through => :match_assignments#, :source => :player_id
  has_many :match_assignments , :dependent => :destroy
  
  validates_presence_of :other_team, :message => "Fyll i match"
  
  def name
    self.other_team + self.datum.strftime(" %d/%m")
  end
end
