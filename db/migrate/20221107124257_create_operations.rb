class CreateOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :operations do |t|
      t.string :hashed_id
      t.string :type_operation
      t.string :operation
      t.string :result
      t.string :title
      t.string :id_url_video_youtube
      t.string :help
      t.integer :point, default: 0, null: false
      t.boolean :show, default: true

      t.timestamps
    end
  end
end
