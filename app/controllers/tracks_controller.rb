class TracksController < ApplicationController
  def index
    @tracks = Track.all
  end

  def show
    @user = User.find_by_token(session[:token])
    @track = Track.find(params[:id])
    @note = Note.new
  end

  def new
    @albums = Album.all
    @track = Track.new
  end

  def create
    Track.create(params[:track])
    redirect_to tracks_url
  end

  def edit
    @albums = Album.all
    @track = Track.find(params[:id])
  end

  def update
    Track.find(params[:id]).update_attributes(params[:track])
    redirect_to track_url
  end

  def destroy
    Track.find(params[:id]).destroy
    redirect_to tracks_url
  end
end
