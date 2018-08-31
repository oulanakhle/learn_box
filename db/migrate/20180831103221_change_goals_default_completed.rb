class ChangeGoalsDefaultCompleted < ActiveRecord::Migration[5.2]
  def change
    change_column :goals, :completed, :boolean, :default => false, :null => false
  end
end
