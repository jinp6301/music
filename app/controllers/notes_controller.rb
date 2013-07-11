class NotesController < ApplicationController
  def create
    Note.create(params[:note])
    redirect_to track_url(params[:note][:track_id])
  end
end