class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :teacher_id,         null: false
      t.integer :lesson_schedule_id, null: false
      t.integer :student_id
      t.boolean :availability,       null: false, default: false

      t.timestamps null: false
    end

    add_index :lessons, [:teacher_id, :lesson_schedule_id], unique: true
  end
end
