ActiveAdmin.register User, as: 'User' do
  menu label: 'Student'
  permit_params :name, :email, :address, :enrollment_number, :phone_number
  actions :index, :create, :edit, :update

  filter :name
  filter :email
  filter :enrollment_number
  
  index :title => "Student" do
    column :id
    column :name
    column 'Email ID' do |resource|
      resource.email
    end
    column :enrollment_number
    column :phone_number
    column :address
    actions 
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    inputs 'Student' do
      f.input :name
      f.input :email
      f.input :enrollment_number
      f.input :phone_number
      f.input :address
    end
    actions
  end 
end
