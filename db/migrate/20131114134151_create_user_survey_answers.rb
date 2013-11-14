class CreateUserSurveyAnswers < ActiveRecord::Migration
  def change
    create_table :user_survey_answers do |t|
      t.string :value
      t.integer :user_survey_id
      t.integer :survey_question_id
      t.timestamps
    end

    add_index :user_survey_answers, :user_survey_id
    add_index :user_survey_answers, :survey_question_id
  end
end
