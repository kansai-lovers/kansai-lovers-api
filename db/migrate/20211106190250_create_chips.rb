class CreateChips < ActiveRecord::Migration[6.1]
  def change
    create_table :chips do |t|
      t.references :members, null: false, foreign_key: true
      t.string :value , null: false
      t.string :color , null: false
      t.timestamps
    end
  end
end
