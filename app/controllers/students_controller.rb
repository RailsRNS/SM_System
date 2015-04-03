class StudentsController < ApplicationController
  #gem 'decent_exposure', '~>2.3.2'
  #expose(:articles){Article.order(:name)}
  #expose(:controller_name){Model.order(:attribute_name)}

  expose(:student) {Student.new}
  expose(:students) {Student.all}
  expose(:new_student) {Student.new(student_params)}
  expose(:existing_student) { Student.find(params[:id]) }



  def index
  #@student=Student.all
  end

  def new
   # @student=Student.new
  end



  def create
    #@student=Student.new(student_params)

    if new_student.save

      redirect_to students_path
      #redirect_to students_path
    else
      render "new"
    end

  end

  def show
    @tcs = existing_student.student_course_sections
    @list_all_unasigned_course_sections= unassigned_student_course_sections
  end


  def edit
  end

  def update
    if existing_student.update_attributes(student_params)
      redirect_to students_path "Student successfully Registered"
    else
      render "new"
    end
  end

  def destroy
    existing_student.destroy
    redirect_to students_path
  end

  public
  def student_params
    params.require(:student).permit(:student_name)
  end

  def unassigned_student_course_sections
    if existing_student.student_course_sections.count > 0
      CourseSection.where("course_id not IN (?)", existing_student.student_course_sections.map(&:course_id))
    else
      CourseSection.all
    end
  end

  def relate_course_section
    c = Course.find(params[:cid])
    s = Section.find(params[:sid])
    t = Student.find(params[:stdid])

    cs = StudentCourseSection.all.where(:course_id => c.id,:section_id => s.id, student_id: t.id).first_or_create  # prevent duplication and add new
    #first_or_create 1st check yes or nor, if yes no entry else add new
    redirect_to t, :notice=> "Your Student, course and section mapped successfully"

  end


  def delete_course_sections_relation
    aa = StudentCourseSection.find_by(id: params[:id])
    std = aa.student
    if aa.present?
      aa.delete
    end
    redirect_to std, :notice=> "Your course has been deleted"
    end

end

