class ModifyCarouselitems < ActiveRecord::Migration
  def self.up
    change_table :carousel_items do |t|
      t.has_attached_file :image
      remove_column :carousel_items, :url    
    end
  end

  def self.down
    drop_attached_file :carousel_items, :image
    add_column :carousel_items, :url, :string
  end
end
