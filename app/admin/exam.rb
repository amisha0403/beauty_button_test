ActiveAdmin.register Exam, as: 'Exam' do
  menu label: 'Exam'

  permit_params :name, :date_from, :date_to, :timing, :no_of_questions, :result, student_attributes: [:id, :name, :email, :phone_number, :enrollment_number, :address], 
  result_attributes: [:id, :student_id, :exam_id, :no_correct, :no_incorrect, :score, :result],
  exam_question_attributes: [:exam_id]

  config.filters = false

  index do
    column :id
    column :name
    column :date_from
    column :date_to
    column :timing
    column :no_of_questions
    actions 
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    inputs 'Exam' do
      f.input :name
      f.input :date_from, as: :datetime_picker 
      f.input :date_to, as: :datetime_picker 
      f.input :timing
      f.input :no_of_questions
    end
    actions
  end 

end
