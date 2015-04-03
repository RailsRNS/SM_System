class Student < ActiveRecord::Base



  has_many :student_course_sections
  has_many :courses, :through=>:student_course_sections
  has_many :sections, :through=>:student_course_sections
end
