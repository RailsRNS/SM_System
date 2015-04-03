class CreateTeacherCourseSections < ActiveRecord::Migration
  def change
    create_table :teacher_course_sections do |t|
      t.belongs_to :course_section
      t.belongs_to :teacher

      t.timestamps
    end
  end
end
