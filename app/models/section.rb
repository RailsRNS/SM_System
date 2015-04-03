class Section < ActiveRecord::Base

  validates :section_name, :presence => true, :uniqueness=>true


  has_many :course_sections
  has_many :courses, :through=>:course_sections
end
