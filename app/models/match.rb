class Match < ActiveRecord::Base
  
  # attr_accessible :title, :content, :assets_attributes
  attr_accessible :datum, :player_ids, :tid, :other_team, :score_other, :season, :goals_attributes

  
  belongs_to :season
  has_many :goals #many goals in a match
  has_many :players, :through => :match_assignments#, :source => :player_id
  has_many :match_assignments , :dependent => :destroy
  
  validates_presence_of :other_team, :message => "Fyll i match"
  
  accepts_nested_attributes_for :goals, :allow_destroy => true
  
  def name
    self.other_team + self.datum.strftime(" %d/%m")
  end
end
