ActiveAdmin.register Question, as: 'Question' do
  menu label: 'Question'
  permit_params :exam_question_id, :question
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
      f.input :exam_question_id, :as => :select, :collection => ExamQuestion.all.ids
      f.input :question
    end
    actions
  end 

end
