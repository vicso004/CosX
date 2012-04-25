class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :datetime
      t.string :other_team
      t.integer :score_other
      t.integer :seasone_id ## byt namn på och koppla sen

      t.timestamps
    end
  end
end
