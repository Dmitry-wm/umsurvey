class AddSupervisorId < ActiveRecord::Migration
  def up
    add_column :users, :supervisor_id, :integer
  end

  def down
    remove_column :users, :supervisor_id, :integer
  end
end
