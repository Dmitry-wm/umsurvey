class CreateUserSurveyTable < ActiveRecord::Migration
  def up
    create_table :user_surveys do |t|
      t.integer :user_id
      t.integer :survey_id
      t.timestamps
    end

    add_index :user_surveys, :user_id
    add_index :user_surveys, :survey_id
  end

  def down
    drop_table :user_surveys
  end
end
