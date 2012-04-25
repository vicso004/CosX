class Post < ActiveRecord::Base
  
  
  
  def self.feed(last)
  		self.where("created_at < ? ", last).order('created_at desc').limit(2)
  	end
  
end
