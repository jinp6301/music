class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user, url)
    @user = user
    @url  = url
    mail(to: @user.email, subject: 'Welcome to Music Site')
  end
end
