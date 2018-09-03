class AddIconToSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :icon, :string, :default => "", :null => ""

    add_column :goals, :progress, :integer, :default => 0, :null => 0
    add_column :goals, :votes, :integer, :default => 0, :null => 0
    add_reference :goals, :user, index: true

    add_column :tasks, :weekday, :integer, :default => 0, :null => 0
    add_column :tasks, :challenge_week, :integer, :default => 0, :null => 0

    add_column :links, :name, :string
    add_column :links, :description, :string, :default => "", :null => ""

  end
end
