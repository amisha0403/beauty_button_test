class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
    	t.integer :student_id
      t.string :name
      t.timestamps
    end
  end
end
