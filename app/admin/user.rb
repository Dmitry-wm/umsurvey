ActiveAdmin.register User do
  index do
    column :first_name
    column :last_name
    column :email
    default_actions
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  filter :email
end
