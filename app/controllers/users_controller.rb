class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create(params[:user])
    redirect_to users_url
  end
end
