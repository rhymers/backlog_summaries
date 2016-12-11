class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.string :summary
      t.integer :component_id
      t.integer :created_user_id
      t.integer :component_id
      t.date :updated_on
      t.date :due_date
      t.integer :assigner_id
      t.integer :priority_id
      t.string :url
      t.integer :issue_type_id
      t.date :created_on
      t.float :estimated_hours
      t.integer :milestone_id
      t.date :start_date
      t.integer :status_id
      t.integer :project_id

      t.timestamps
    end
  end
end
