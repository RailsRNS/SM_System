class CoursesController < ApplicationController
  def index
    @course=Course.all
  end

  def new
    @course=Course.new
  end

  def create
    @course=Course.new(course_params)
    if @course.save
      redirect_to courses_path
      #redirect_to courses_path :notice=>"course saved"
    else
      render "new"
    end
  end

  def show
    @course=Course.find(params[:id])
    @rec_course_section=CourseSection.find_by(course_id: params[:id])
    @un_assigned_sections=Section.all - @course.sections


  end

  def edit
    @course =Course.find(params[:id])

  end

  def update
    @course=Course.find(params[:id])

    if @course.update_attributes(course_params)
      redirect_to courses_path, :notice=> "Course updated"
    else
      render "edit"
    end
  end




  def destroy
    @course=Course.find(params[:id])
    @course.destroy if CourseSection.all.where(:course_id => @course.id).blank?

    redirect_to courses_path, :notice=> "Course deleted"

  end

  def add_course_section
    @course = Course.find(params[:cid])
    s = Section.find(params[:sid])
    cs = CourseSection.all.where(:course_id => @course.id, section_id: s.id).first_or_create  # prevent duplication and add new
   redirect_to @course, :notice=> "Your course and section now tagged"
  end

  def delete_course_sections
    course = Course.find(params[:cid])
    aa = CourseSection.find_by(course_id: params[:cid], section_id: params[:sid])
    if aa.present?
      aa.delete
    end
    redirect_to course, :notice=> "Your course has been deleted"

  end

  def course_params
    params.require(:course).permit(:course_name, sections_attributes: [:section_name, :id])
  end

end
