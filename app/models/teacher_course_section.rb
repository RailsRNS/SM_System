class TeacherCourseSection < ActiveRecord::Base


  belongs_to :course_section
  belongs_to :teacher
end
