class Notifier < ActionMailer::Base
  default from: "from@example.com"

  def report_notification(survey)
    @survey = survey
    @user = survey.user
    mail(to: @survey.user.supervisor.email,  subject: "report filled")
  end
end
