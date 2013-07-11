class UsersController < ApplicationController

  before_filter :authenticate, except: [:new, :create, :activate]

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

  def activate
    user = User.find_by_activation_token(params[:token])
    user.activation_token = nil

    user.token = SecureRandom.urlsafe_base64(8)
    user.save
    session[:token] = user.token
    redirect_to bands_url
  end
end
