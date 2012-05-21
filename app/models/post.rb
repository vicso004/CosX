class Post < ActiveRecord::Base
  
  validates_presence_of :title, :body, :on => :create, :message => "Fyll i titel"

end
