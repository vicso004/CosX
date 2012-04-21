class Player < ActiveRecord::Base
	has_one :user

	validates :name, :presence => true


	def self.find_or_create_by(name)

		player = Player.where(:name => name)

		if not player.exists?
			player = Player.create(:name => name)
		end
		player

	end


end
