class Api::V1::MoviesController < ApplicationController

  before_action :set_movie, only: [:show, :destroy]
  after_action :reindex, only: :create

  # GET /movies
  def index
    @movies = Movie.all
    render json: @movies
  end

  # GET /movies/:id
  def show
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
    @movie.destroy
  end

  private
  def reindex
    Movie.reindex!
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.permit(:id, :title, :rating)
  end

end
