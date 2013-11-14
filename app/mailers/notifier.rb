class Notifier < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"

  def report_notification(survey)
    @survey = survey
    @user = survey.user
    mail(to: @survey.user.supervisor.email,  subject: "report filled")
  end
end
