class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.integer :user_id
      t.string :title
      t.string :employer
      t.text :description
      t.date :start_date
      t.date :end_date
    end
    add_index :experiences, :user_id
  end
end
