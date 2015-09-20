class Lesson < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :lesson_schedule
  belongs_to :student
end
