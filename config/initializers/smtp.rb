ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :user_name            => "test.devbetter@gmail.com",
  :password             => "Test123!",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
