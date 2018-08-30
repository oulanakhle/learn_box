class AddHoursToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :hours, :integer
  end
end
