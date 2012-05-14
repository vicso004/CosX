class ModifyPlayers < ActiveRecord::Migration
  def change
    change_column :players, :active, :boolean
  end
end
