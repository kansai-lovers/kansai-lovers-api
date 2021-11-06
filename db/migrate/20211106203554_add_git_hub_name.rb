class AddGitHubName < ActiveRecord::Migration[6.1]
  def change
      add_column :members, :github_name, :string
  end
end
