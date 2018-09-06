class ChangeDifficultyToGoals < ActiveRecord::Migration[5.2]
  def change
    change_column :goals, :difficulty, :string
  end
end
