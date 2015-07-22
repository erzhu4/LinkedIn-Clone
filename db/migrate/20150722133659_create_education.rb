class CreateEducation < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.integer :user_id
      t.string :school, null: false
      t.string :degree
      t.string :field
      t.integer :graduation_year
    end
    add_index :educations, :user_id
  end
end
