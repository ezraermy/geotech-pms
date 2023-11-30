class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.text :task, null: false
      t.date :date, null: false

      # Add any additional columns you need for your Project model

      t.timestamps
    end
  end
end
