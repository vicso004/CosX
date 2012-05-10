class CarouselItem < ActiveRecord::Base

#validates_presence_of :url
 has_attached_file :image,
    :styles => {
      :thumb=> "100x100#",  #Exakt crop 100x100
      :small  => "300x300>",
      :large => "600x600>"} 
end
