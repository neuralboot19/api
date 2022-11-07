class CreateAchievements < ActiveRecord::Migration[7.0]
  def change
    create_table :achievements do |t|
      t.string :hashed_id
      t.string :name
      t.integer :points, default: 0, null: false
      t.string :icon

      t.timestamps
    end
  end
end
