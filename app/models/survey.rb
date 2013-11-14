class Survey < ActiveRecord::Base
  attr_accessible :title, :questions_attributes

  has_many :questions, class_name: "SurveyQuestion", dependent: :delete_all
  has_many :answers, class_name: "SurveyAnswer", dependent: :delete_all
  has_many :result_surveys, class_name: "UserSurvey"

  validates :title, presence: true
  validate :questions_presence

  accepts_nested_attributes_for :questions, allow_destroy: true

  def questions_presence
    #errors.add(:questions_deleted, "At least one question should be present") if  questions.all?(&:marked_for_destruction?)
  end
end