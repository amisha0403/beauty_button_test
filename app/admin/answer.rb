ActiveAdmin.register Answer, as: 'Answer' do
  menu label: 'Answer'
  permit_params :question_id, :answer, :is_correct
  config.filters = false

  index do
    column :id
    column :question_id
    column :answer
    toggle_bool_column :is_correct
    actions 
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    inputs 'Answer' do
      f.input :question_id, :as => :select, :collection => Question.all.map{|q| [q.question, q.id]}
      f.input :answer
    end
    actions
  end 

end
