class CourseSection < ActiveRecord::Base

  belongs_to :course
  belongs_to :section
end
