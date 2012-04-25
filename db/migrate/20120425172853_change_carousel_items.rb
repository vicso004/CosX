class ChangeCarouselItems < ActiveRecord::Migration
  def change
  	add_column :carousel_items, :active, :boolean
  end

end
