class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.date :start_date, null: false
      t.date :due_date, null: false
      t.string :status, null: false

      # Add any additional columns you need for your Assignment model

      t.timestamps
    end
  end
end
