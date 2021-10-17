ActiveAdmin.register Result, as: 'Result' do
  menu label: 'Result'
  permit_params :student_id, :exam_id, :no_correct, :no_incorrect, :score, :result
  config.filters = false

  index do
    column :id
    column 'Student' do |resource|
      resource.student.name
    end
    column 'Exam' do |resource|
      resource.exam.name
    end
    column :no_correct
    column :no_incorrect
    column :score
    column :result
    actions 
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    inputs 'Result' do
      f.input :student_id
      f.input :exam_id
      f.input :no_correct
      f.input :no_incorrect
      f.input :score
      f.input :result
    end
    actions
  end 

end
