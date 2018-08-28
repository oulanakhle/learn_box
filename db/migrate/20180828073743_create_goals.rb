class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :name
      t.integer :goal_difficulty
      t.boolean :completed
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
