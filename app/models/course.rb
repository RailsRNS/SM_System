class Course < ActiveRecord::Base

  validates :course_name, :presence => true, :uniqueness=>true


  has_many :course_sections
  has_many :sections, :through=>:course_sections
  #has_many  :course_sections
  #has_many  :sections, through: :course_sections
end
