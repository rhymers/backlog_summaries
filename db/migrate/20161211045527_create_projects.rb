class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :archived
      t.string :name
      t.string :key
      t.string :url
      t.string :text_formatting_rule
      t.string :use_parent_child_issue

      t.timestamps
    end
  end
end
