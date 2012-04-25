class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :match_id
      t.integer :goaler_id
      t.integer :assister_id

      t.timestamps
    end
    
     add_index :goals, :match_id
      add_index :goals, :goaler_id
      add_index :goals, :assister_id
    
  end
end
