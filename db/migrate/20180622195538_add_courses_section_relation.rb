class AddCoursesSectionRelation < ActiveRecord::Migration[5.1]
  def change
    add_reference :courses, :section, index: true
  end
end
