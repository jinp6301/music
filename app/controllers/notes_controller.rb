class NotesController < ApplicationController
  def create
    params[:note][:user_id] = User.find_by_token(session[:token]).id
    Note.create(params[:note])
    redirect_to track_url(params[:note][:track_id])
  end
end