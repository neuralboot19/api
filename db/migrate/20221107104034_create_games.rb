class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :hashed_id
      t.string :title
      t.string :img
      t.boolean :show, default: true

      t.timestamps
    end
  end
end
