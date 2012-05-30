class ModifyPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :active
    add_column :players, :active, :boolean
  end
end
