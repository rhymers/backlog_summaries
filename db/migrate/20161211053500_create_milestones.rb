class CreateMilestones < ActiveRecord::Migration[5.0]
  def change
    create_table :milestones do |t|
      t.string :date
      t.string :name

      t.timestamps
    end
  end
end
