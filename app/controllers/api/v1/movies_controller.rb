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

  # POST /movies
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: @movie, status: :created, location: api_v1_movie_url(@movie)
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movies/:id
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
  end

  def movie_params
    params.permit(:id, :title, :rating)
  end

end
