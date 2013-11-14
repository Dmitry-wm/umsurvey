class UserSurveyAnswer < ActiveRecord::Base
  attr_accessible :user_survey_id, :value, :survey_question_id
  belongs_to :question, class_name: "SurveyQuestion", foreign_key: :survey_question_id

  validates :value, presence: true

  delegate :value, to: :question, prefix: true
end
