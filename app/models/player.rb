class Player < ActiveRecord::Base
	has_one :user
  has_and_belongs_to_many :matches ## a player participates in many matches

	validates :name, :presence => true


	def self.find_or_create_by(name)

		player = Player.where(:name => name)

		if not player.exists?
			player = Player.create(:name => name)
		end
		player

	end


end
