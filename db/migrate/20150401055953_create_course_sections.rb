class CreateCourseSections < ActiveRecord::Migration
  def change
    create_table :course_sections do |t|
      t.belongs_to :course
      t.belongs_to :section

      t.timestamps
    end
  end
end
