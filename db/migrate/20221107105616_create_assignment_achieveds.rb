class CreateAssignmentAchieveds < ActiveRecord::Migration[7.0]
  def change
    create_table :assignment_achieveds do |t|
      t.string :hashed_id
      t.references :user, foreign_key: true, on_delete: :cascade
      t.references :achievement, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
