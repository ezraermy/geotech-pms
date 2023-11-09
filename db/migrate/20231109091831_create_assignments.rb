class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.date :start_date
      t.date :due_date
      t.string :status

      t.timestamps
    end
  end
end
