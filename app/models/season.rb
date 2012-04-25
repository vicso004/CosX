class Season < ActiveRecord::Base
  
  has_many :matches
  
  
  def full_name
    period+' '+year.to_s
  end
  
end
