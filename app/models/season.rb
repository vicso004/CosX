class Season < ActiveRecord::Base
  
  has_many :matches
  
  validates_presence_of :period, :year, :message => "Fyll i"
  def full_name
    period+' '+year.to_s
  end
  
end
