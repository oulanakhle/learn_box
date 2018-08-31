class ChangeGoalsDefaultCompleted < ActiveRecord::Migration[5.2]
  def change
    change_column :goals, :completed, :boolean, :null => false, :default => false
  end
end
