class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def show
    @band = Band.find(params[:id])
  end

  def new
    @band = Band.new
  end

  def create
    Band.create(params[:band])
    redirect_to bands_url
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    Band.find(params[:id]).update_attributes(params[:band])
    redirect_to band_url
  end

  def destroy
    Band.find(params[:id]).destroy
    redirect_to bands_url
  end
end
