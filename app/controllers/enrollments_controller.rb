class EnrollmentsController < ApplicationController
  before_actions :set_course
  before_actions :set_enrollment, only: [:show, :edit]

  def index
    # @enrollments = @course.enrollments
    @teachers = @course.enrollments.where(role: 'teacher')
    @tas = @course.enrollments.where(role: 'ta')
    @student = @course.enrollments.where(role: 'student')
  end

  def new
    @enrollments = @course.enrollments.new
  end

  def create
    @enrollments = @course.enrollments.new(enrollment_params)
    if @enrollment.save
      redirect_to course_enrollment_path(@course)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @enrollment.update(enrollment_params)
      redirect_to course_enrollment_path(@course)
    else
      render :edit
    end
  end

  def destroy
    @enrollment.destroy
    redirect_to course_enrollment_path(@course)
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:role, :user_id)
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_enrollment
    @enrollment = @course.enrollments.find(params[:id])
  end

end
