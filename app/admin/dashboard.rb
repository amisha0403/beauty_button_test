ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }
  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Welcome to Beauty-Button Admin Section"
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    columns do
      column do
        panel "Recent Users" do
          table_for User.last(5) do |account|
            column "id" do |p| link_to "#{p.id}", "admin/users/#{p.id}" end
            column :name
            column :email
            column :phone_number
            column :enrollment_number
          end
          span class: "action_item action_items" do
            link_to("All Users", admin_users_path)
          end
        end
      end
      column do
        panel "Recent Exam" do
          table_for Exam.last(5) do |account|
            column "id" do |p| link_to "#{p.id}", "admin/users/#{p.id}" end
            column :name
            column :date_from
            column :date_to
            column :timing
            column :no_of_questions
          end
          span do
            link_to("All Exam", admin_exams_path)
          end
        end
      end
    end
    columns do
      column do
        panel "Recent Question" do
          table_for Question.all.order(:id) do |p|
            column "id" do |p| link_to "#{p.id}", "admin/users/#{p.id}" end
            column :question
          end
          span class: "action_item action_items" do
            link_to("All Questions", admin_questions_path)
          end
        end
      end
    end
  
  end # content
end

