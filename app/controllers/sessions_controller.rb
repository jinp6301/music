class SessionsController < ApplicationController
  before_filter :authenticate, except: [:new, :create]

  def create
    user = User.find_by_email(params[:session][:email])
    if user.password == params[:session][:password] &&
      !user.activation_token # make sure account has been activated
      user.token = SecureRandom.urlsafe_base64(8)
      user.save
      session[:token] = user.token
      redirect_to bands_url
    else
      redirect_to new_session_url(error: "Incorrect password")
    end
  end
end