class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name , null: false
      t.string :role , null: true
      t.string :join_date , null: true
      t.string :avatar_url , null: true
      t.string :url , null: true
      t.integer :total_good_count , null: false, default: 0
      t.integer :total_bad_count , null: false, default: 0
      t.integer :total_laugh_count , null: false, default: 0
      t.integer :total_hooray_count , null: false, default: 0
      t.integer :total_confuse_count , null: false, default: 0
      t.integer :total_heart_count , null: false, default: 0
      t.integer :total_rocket_count , null: false, default: 0
      t.integer :total_eyes_count , null: false, default: 0
      t.timestamps
    end
  end
end
