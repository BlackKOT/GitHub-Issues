class AddNumberToIssues < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :issue_number, :integer
  end
end
