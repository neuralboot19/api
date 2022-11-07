class CreateLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :levels do |t|
      t.string :hashed_id
      t.string :name
      t.integer :points, default: 0, null: false

      t.timestamps
    end
  end
end
