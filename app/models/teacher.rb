class Teacher < ActiveRecord::Base
  has_many :lessons
  has_many :lesson_schedules
end
