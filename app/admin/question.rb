ActiveAdmin.register Question, as: 'Question' do
  menu label: 'Question'
  permit_params :exam_question, :question
  config.filters = false
  
  index do
    column :id
    column :exam_question
    column :question
    actions 
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    inputs 'Question' do
      f.input :exam_question
      f.input :question
    end
    actions
  end 

end
