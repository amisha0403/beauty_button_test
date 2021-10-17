class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.integer :student_id
      t.integer :exam_id
      t.integer :no_correct
      t.integer :no_incorrect
      t.integer :score
      t.integer :result
      t.timestamps
    end
  end
end
