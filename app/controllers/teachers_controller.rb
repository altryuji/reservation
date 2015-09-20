class TeachersController < ApplicationController
  before_action :set_teacher,    only: [:show, :edit, :update]
  before_action :set_time_slots, only: [:show, :update]
  before_action :set_weekdays,   only: [:show, :update]


  def index
    @teachers = Teacher.all
  end

  def show
  end

  def update
    selected_lessons = (params[:selected_lessons] || {}).select { |k, v| v == '1' }.keys

    lesson_schedule_ids     = LessonSchedule.where(start_time: selected_lessons).pluck(:id)
    existing_lesson_ids     = Lesson.where(teacher_id: @teacher, lesson_schedule_id: lesson_schedule_ids).pluck(:lesson_schedule_id)
    non_existing_lesson_ids = lesson_schedule_ids - existing_lesson_ids

    # TODO: should be extracted as a method in model
    if existing_lesson_ids.present?
      Lesson.where(teacher_id: @teacher, lesson_schedule_id: existing_lesson_ids).update_all(availability: true)
    end

    # TODO: should be extracted as a method in model
    if non_existing_lesson_ids.present?
      # TODO: should use import to avoid multiple queries
      non_existing_lesson_ids.each do |l_id|
        Lesson.create(teacher_id: @teacher.id, lesson_schedule_id: l_id, availability: true)
      end
    end

    # TODO: should be extracted as a method in model
    Lesson.where(teacher_id: @teacher).where("lesson_schedule_id NOT IN (?)", lesson_schedule_ids).update_all(availability: false)

    # TODO: should be extracted as a method in model
    @available_lessons = Lesson.includes(:lesson_schedule).where(teacher_id: 1, availability: true).map { |l| l.lesson_schedule.start_time }

    render 'show'
  end


  private
    def set_time_slots
      @time_slots ||= (00..23).to_a.map { |hour| hour = '%02d' % hour; ["#{hour}00", "#{hour}30"] }.flatten
    end

    WEEKDAYS = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    def set_weekdays
      @weekdays ||= WEEKDAYS
    end

    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    def teacher_params
      params.require(:teacher).permit(:email, :name)
    end
end
