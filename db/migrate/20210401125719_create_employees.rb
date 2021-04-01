class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :email, null: false, index: true
      t.date :dob, null: false
      t.string :mobile, null: false
      t.string :designation, null: false
      t.integer :salary, null: false
      t.references :manager, null: false, foreign_key: true

      t.timestamps
    end
  end
end
