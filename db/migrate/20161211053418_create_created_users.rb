class CreateCreatedUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :created_users do |t|
      t.string :name

      t.timestamps
    end
  end
end
