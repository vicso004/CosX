class Player < ActiveRecord::Base
	has_one :user
  has_and_belongs_to_many :matches ## a player participates in many matches

	validates :name, :presence => true


end
