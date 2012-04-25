class ChangeMatches < ActiveRecord::Migration
  def up
    remove_column :matches, :seasone_id
    add_column :matches, :season_id, :integer
    add_index :matches, :season_id
  end

  def down
  end
end
