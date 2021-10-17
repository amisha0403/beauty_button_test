class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.string :name
      t.datetime :date_from
      t.datetime :date_to
      t.integer :timing
      t.integer :no_of_questions
      t.timestamps
    end
  end
end
