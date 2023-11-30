class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :encrypted_password, null: false

      # Add any additional columns you need for your User model

      t.timestamps
    end
  end
end
