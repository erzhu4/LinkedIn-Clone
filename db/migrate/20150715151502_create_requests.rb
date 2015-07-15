class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :sender_id, null: false
      t.integer :responder_id, null: false
      t.timestamps
    end
    add_index :requests, :sender_id
    add_index :requests, :responder_id
  end
end
