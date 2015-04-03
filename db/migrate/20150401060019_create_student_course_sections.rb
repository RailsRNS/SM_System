class CreateStudentCourseSections < ActiveRecord::Migration
  def change
    create_table :student_course_sections do |t|

      t.belongs_to :course
      t.belongs_to :section
      t.belongs_to :student

      t.timestamps
    end
  end
end
