class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :subject_difficulty
      t.integer :review_frequency
      t.integer :subject_progress
      t.boolean :private
      t.integer :rating
      t.string :description

      t.timestamps
    end
  end
end
