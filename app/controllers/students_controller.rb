class StudentsController < ApplicationController
  before_action :set_student, only: [:show]
  before_action :set_time_slots, only: [:show, :show]
  before_action :set_weekdays,   only: [:show, :show]

  def show
    @teachers = Teacher.all
    @lessons  = Lesson.joins([:teacher, :lesson_schedule])
  end

  private
    def set_time_slots
      @time_slots ||= (00..23).to_a.map { |hour| hour = '%02d' % hour; ["#{hour}00", "#{hour}30"] }.flatten
    end

    WEEKDAYS = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    def set_weekdays
      @weekdays ||= WEEKDAYS
    end

    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:email, :name)
    end
end
