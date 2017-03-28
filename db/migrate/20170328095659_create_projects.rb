class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.date :dueDate
      t.decimal :budget, precision: 8, scale: 2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
