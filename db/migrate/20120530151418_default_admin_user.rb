class DefaultAdminUser < ActiveRecord::Migration
  def change
    remove_column :users, :admin
    change_table :users do |t|
      t.boolean :admin, :default => false
    end
  end
end
