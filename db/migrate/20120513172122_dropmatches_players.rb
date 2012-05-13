class DropmatchesPlayers < ActiveRecord::Migration
  def change
    drop_table :matches_players
    
  end
end
