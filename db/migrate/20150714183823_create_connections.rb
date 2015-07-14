class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :user_id1, null: false
      t.integer :user_id2, null: false
      t.timestamps
    end
    add_index :connections, :user_id1
    add_index :connections, :user_id2
  end
end
