class AddUserToIssues < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :user_name, :string
  end
end
