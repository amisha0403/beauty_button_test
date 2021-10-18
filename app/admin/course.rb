ActiveAdmin.register Course, as: 'Course' do
  menu label: 'Course'
  permit_params :name
  config.filters = false
  
  index do
    column :id
    column :name
    actions 
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    inputs 'Course' do
      f.input :name
    end
    actions
  end 

end
