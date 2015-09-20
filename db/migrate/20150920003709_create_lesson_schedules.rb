class CreateLessonSchedules < ActiveRecord::Migration
  def change
    create_table :lesson_schedules do |t|
      t.string :start_time, null: false

      t.timestamps null: false
    end

    add_index :lesson_schedules, :start_time, unique: true
  end
end
