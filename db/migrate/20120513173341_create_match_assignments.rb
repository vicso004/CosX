class CreateMatchAssignments < ActiveRecord::Migration
  def change
    create_table :match_assignments do |t|
      t.integer :player_id
      t.integer :match_id
      t.boolean :confirmed

      t.timestamps
    end
    
       add_index :match_assignments, :player_id
      add_index :match_assignments, :match_id
  end
end
