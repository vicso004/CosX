class ModifyMatchDatetime < ActiveRecord::Migration
  def change
    
    remove_column :matches, :datetime
    add_column :matches, :datum, :date
    add_column :matches, :tid, :time
  end

end
