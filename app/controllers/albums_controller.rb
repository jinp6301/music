class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @bands = Band.all
    @album = Album.new
    @locations = Album::LOCATIONS
  end

  def create
    Album.create(params[:album])
    redirect_to albums_url
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    Album.find(params[:id]).update_attributes(params[:album])
    redirect_to album_url
  end

  def destroy
    Album.find(params[:id]).destroy
    redirect_to albums_url
  end
end
