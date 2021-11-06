class CreateGithubAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :github_accounts do |t|
      t.references :members, null: false, foreign_key: true
      t.string :name , null: false
      t.text :url , null: false
      t.timestamps
    end
  end
end
