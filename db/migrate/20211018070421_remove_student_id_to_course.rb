class RemoveStudentIdToCourse < ActiveRecord::Migration[6.0]
  def change
  	remove_column :courses, :student_id, :integer
  end
end



   
   