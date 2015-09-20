class LessonSchedule < ActiveRecord::Base
  has_many :lessons
end
