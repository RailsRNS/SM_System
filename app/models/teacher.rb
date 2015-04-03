class Teacher < ActiveRecord::Base


  has_many :teacher_course_sections
  has_many :course_sections, :through=>:teacher_course_sections
end
