class Api::V1::MoviesController < ApplicationController

  # GET /movies
  def index
    @movies = Movie.all 
    render json: @movies
  end

end
