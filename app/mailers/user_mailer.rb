class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email
    @user = user
    @url  = 'http://localhost:3000/sessions/new'
    mail(to: user.email, subject: 'Welcome to Music Site')
  end
end
