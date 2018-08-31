class ChangeGoalDifficulty < ActiveRecord::Migration[5.2]
  def change
    rename_column :goals, :goal_difficulty, :difficulty
  end
end
