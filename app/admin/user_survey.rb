ActiveAdmin.register UserSurvey do
  menu label: "Survey Results"

  actions :index, :show, :destroy

  index do
    column :user_id
    column :user_full_name
    column :title
    default_actions
  end

  show do |result|
    attributes_table do
      row :title
      row :employee do
        result.user_full_name
      end

      row :results do
        ""
      end

      result.answers.includes(:question).each do |answer|

        row :question do
          answer.question_value
        end
        row :answer do
          answer.value
        end
      end
    end
  end

  filter :created_at
  filter :user_first_name_or_user_last_name, as: :string
  filter :user_email, as: :string
end
