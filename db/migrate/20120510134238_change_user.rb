class ChangeUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :bolean
  end
end
