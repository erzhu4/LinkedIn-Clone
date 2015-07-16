class AddCurrent < ActiveRecord::Migration
  def change
    add_column :experiences, :current, :boolean, default: false
  end
end
