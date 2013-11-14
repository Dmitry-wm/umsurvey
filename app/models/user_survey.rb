class UserSurvey < ActiveRecord::Base
  attr_accessible :user_id, :survey_id, :answers_attributes

  belongs_to :user
  belongs_to :survey
  has_many :questions, through: :survey
  has_many :answers, class_name: "UserSurveyAnswer", dependent: :delete_all

  validates :user_id, :survey_id, presence: true

  accepts_nested_attributes_for :answers

  delegate :title, to: :survey
  delegate :full_name, to: :user, prefix: true

  after_create :send_report

  def init_answers
    questions.each do |q|
      answers.build(survey_question_id: q.id)
    end
  end

  def send_report
    Notifier.report_notification(self).deliver if user.supervisor
  end
end
