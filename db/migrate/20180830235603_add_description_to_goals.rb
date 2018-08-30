class AddDescriptionToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :description, :string
  end
end
