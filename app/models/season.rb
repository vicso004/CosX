# -*- coding: utf-8 -*-   
class Season < ActiveRecord::Base
  
  has_many :matches
 
  validates_presence_of :period, :year, :message => "Fyll i fälten"
 
  def name
    self.year.to_s+" "+self.period #namn består av år och period (VT/HT)
  end
  
end
