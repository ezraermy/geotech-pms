class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :location
      t.text :task
      t.date :date

      t.timestamps
    end
  end
end
