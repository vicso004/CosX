class Season < ActiveRecord::Base
  
  has_many :matches
  
  validates_presence_of :period, :year, :message => "Fyll i"
  
  
  
  def name
    self.year.to_s+" "+self.period
  end
  
end
