class CreateLessonSchedules < ActiveRecord::Migration
  def change
    create_table :lesson_schedules do |t|
      t.datetime :lesson_start_datetime, null: false

      t.timestamps null: false
    end

    add_index :lesson_schedules, :lesson_start_datetime, unique: true
  end
end
