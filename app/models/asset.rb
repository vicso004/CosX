class Asset < ActiveRecord::Base          
  #attr_accessible :image_file_name
  belongs_to :article
  has_attached_file :image,
      :styles => {
        :thumb=> "100x100#",  #Exakt crop 100x100
        :small  => "50x50>",
        :large => "600x600>"}
end
