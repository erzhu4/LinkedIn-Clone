class Admin < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, {:default => false}
    add_index :users, :sample
  end
end
