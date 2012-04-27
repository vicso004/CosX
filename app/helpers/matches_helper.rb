module MatchesHelper
  
  def season_collection
    
    a = Array.new()
    Season.all.each do |s|
      a.push(s.full_name)
    end
    a
    
  end
  
end
