class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :fname, null: false
      t.string :lname, nill: false
      t.string :session_token
      t.string :title
      t.string :employer
      t.text :summary
    end
  end
end
