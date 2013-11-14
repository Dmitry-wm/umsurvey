class SurveyQuestion < ActiveRecord::Base
  attr_accessible :survey_id, :value

  belongs_to :survey

  validates :survey_id, :value, presence: true
end