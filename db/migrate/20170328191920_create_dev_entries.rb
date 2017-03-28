class CreateDevEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :dev_entries do |t|
      t.date :devDate
      t.decimal :devDuration, precision: 4, scale: 2
      t.text :note
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
