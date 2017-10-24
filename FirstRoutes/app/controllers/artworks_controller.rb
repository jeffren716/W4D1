class ArtworksController < ApplicationController

  def index
    @artworks = Artwork.all
    render json: @artworks
  end

  def create
    artwork = Artwork.new(params[:artwork].permit(:title))
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    if artwork
      render json: artwork
    else
      render json: artwork.errors.full_messages
    end
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork
      artwork.update_attributes(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages
    end

  end

  def destroy
      artwork = Artwork.find(params[:id])

      if artwork
        artwork.destroy
        render json: artwork
      else
        render json:  artwork.errors.full_messages
      end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title)
  end

end
