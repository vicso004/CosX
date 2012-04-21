class ChangePlayers < ActiveRecord::Migration
  def up
  	add_index :players, :name,                :unique => true
  end

  def down
  end
end
