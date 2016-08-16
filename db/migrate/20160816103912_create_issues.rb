class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.string :project_name
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
