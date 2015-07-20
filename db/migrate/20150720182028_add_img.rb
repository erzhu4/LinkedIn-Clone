class AddImg < ActiveRecord::Migration
  def change
    add_column :users, :img_url, :string
    add_column :users, :sample, :boolean, default: false
  end
end
