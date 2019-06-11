class Api::V1::MoviesController < ApplicationController

  # GET /movies
  def index
    @movies = Movie.all 
    render json: @movies
  end

  # GET /movies/:id
  def show
    @movie = Movie.find(params[:id])
    render json: @movie
  end

end
