ActiveAdmin.register Survey do
  index do
    column :title
    default_actions
  end

  form :partial => "form"

  filter :title
end
