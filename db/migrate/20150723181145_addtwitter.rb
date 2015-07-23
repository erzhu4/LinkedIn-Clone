class Addtwitter < ActiveRecord::Migration
  def change
    add_column :users, :tweet, :boolean, {:default => false}
  end
end
