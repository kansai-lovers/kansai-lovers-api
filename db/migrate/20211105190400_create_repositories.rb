class CreateRepositories < ActiveRecord::Migration[6.1]
  def change
    create_table :repositories do |t|
      t.string :name , null: false
      t.string :owner_name , null: false
      t.timestamps
    end
  end
end
