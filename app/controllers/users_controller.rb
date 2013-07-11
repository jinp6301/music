class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    params[:user][:activation_token] = SecureRandom.urlsafe_base64(8)
    user = User.create(params[:user])
    url = Addressable::URI.new(
      scheme: "http",
      host: "localhost",
      port: 3000,
      path: "users/activate",
      query_values: {token: user.activation_token})
    msg = UserMailer.welcome_email(user, url)
    msg.deliver!
    render :text => "Check your email for the activation link"
  end
end
