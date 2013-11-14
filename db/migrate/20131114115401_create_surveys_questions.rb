class CreateSurveysQuestions < ActiveRecord::Migration
  def up
    create_table :survey_questions do |t|
      t.text :value
      t.integer :survey_id
    end

    add_index :survey_questions, :survey_id
  end

  def down
    drop_table :survey_questions
  end
end
