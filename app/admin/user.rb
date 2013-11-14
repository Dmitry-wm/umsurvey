ActiveAdmin.register User do
  index do
    column :first_name
    column :last_name
    column :email
    column "supervisor" do |u|
      u.supervisor.try(:email)
    end
    default_actions
  end

  form do |f|
    f.inputs "User Details" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :supervisor, as: :select, collection: AdminUser.all.map{ |admin| [admin.email, admin.id] }
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  filter :email
end
