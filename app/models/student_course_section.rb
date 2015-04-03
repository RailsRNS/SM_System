class StudentCourseSection < ActiveRecord::Base

  belongs_to :course
  belongs_to :section
  belongs_to :student
end
