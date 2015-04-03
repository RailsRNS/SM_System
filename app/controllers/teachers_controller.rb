class TeachersController < ApplicationController
  expose(:teachers)
  #expose(:teacher) {Teacher.new}
  expose(:new_teacher) {Teacher.new(teacher_params)}
  expose(:existing_teacher) { Teacher.find(params[:id]) }


  def index
  # @teacher=Teacher.all
  end

  def new
   @teacher=Teacher.new
  end

  def create
    #@teacher=Teacher.new(teacher_params)
    #@teacher.save
    new_teacher.save
    redirect_to teachers_path

    end


  def show
    @tcs =existing_teacher.teacher_course_sections
    @unassigned_course_sections = unassigned_teachers_course_sections
  end
  def unassigned_teachers_course_sections
    if existing_teacher.teacher_course_sections.count > 0
      CourseSection.where("id not IN (?)", existing_teacher.teacher_course_sections.map(&:course_section_id))
    else
      CourseSection.all
    end
  end

  def edit
  end

  def update
    if existing_teacher.update_attributes(teacher_params)
      redirect_to teachers_path "Teacher Saved"
    else
      render "new"
    end
  end

  def destroy
    existing_teacher.destroy
    redirect_to teachers_path
  end

  def add_course_section
    @cs=CourseSection.find(params[:csid])
    t=Teacher.find(params[:tid])
    cs=TeacherCourseSection.all.where(:course_section_id=>@cs.id, teacher_id: t.id).first_or_create
    redirect_to t, :notice=>"Course and Section saved"
  end

  def delete_course_section_relation
    @a=TeacherCourseSection.find(params[:id])
    @t=@a.teacher
    if @a.present?
      @a.delete
    end
    redirect_to @t, :notice=>"course deleted"

  end





  def teacher_params
    params.require(:teacher).permit(:teacher_name)
  end
end
