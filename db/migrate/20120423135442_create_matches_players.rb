class CreateMatchesPlayers < ActiveRecord::Migration
  def change
    create_table :matches_players do |t|
      t.integer :match_id
      t.integer :player_id

      t.timestamps
    end
    
    add_index :matches_players, :match_id
    add_index :matches_players, :player_id
  end
end
