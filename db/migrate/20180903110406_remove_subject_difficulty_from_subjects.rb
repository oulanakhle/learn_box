class RemoveSubjectDifficultyFromSubjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :subjects, :subject_difficulty, :string
    remove_column :subjects, :review_frequency, :integer
    remove_column :subjects, :subject_progress, :integer
    remove_column :subjects, :private, :boolean
    remove_column :subjects, :rating, :integer
    remove_reference :subjects, :user, index: true

    remove_column :tasks, :due_date, :date
    remove_column :tasks, :deadline, :datetime
  end
end
