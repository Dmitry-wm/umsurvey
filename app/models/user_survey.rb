class UserSurvey < ActiveRecord::Base
  attr_accessible :user_id, :survey_id, :answers_attributes

  belongs_to :user
  belongs_to :survey
  has_many :questions, through: :survey
  has_many :answers, class_name: "UserSurveyAnswer", dependent: :delete_all

  validates :user_id, :survey_id, presence: true

  accepts_nested_attributes_for :answers

  delegate :title, to: :survey

  def init_answers
    questions.each do |q|
      answers.build(survey_question_id: q.id)
    end
  end
end
