class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :members, null: false, foreign_key: true
      t.references :repositories, null: false, foreign_key: true
      t.text :text , null: false
      t.text :url , null: false
      t.integer :good_count , null: false, default: 0
      t.integer :bad_count , null: false, default: 0
      t.integer :laugh_count , null: false, default: 0
      t.integer :hooray_count , null: false, default: 0
      t.integer :confuse_count , null: false, default: 0
      t.integer :heart_count , null: false, default: 0
      t.integer :rocket_count , null: false, default: 0
      t.integer :eyes_count , null: false, default: 0
      t.timestamps
    end
  end
end
