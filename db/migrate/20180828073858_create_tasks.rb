class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :due_date
      t.boolean :completed
      t.references :goal, foreign_key: true

      t.timestamps
    end
  end
end
