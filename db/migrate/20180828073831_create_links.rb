class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.references :goal, foreign_key: true

      t.timestamps
    end
  end
end
