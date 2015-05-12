class MoviesController < ApplicationController
  include MoviesHelper
  def index
    @movies = Movie.all
    render 'index'
  end

  def show
    if !params[:id].nil?
      @movie = Movie.find_by(id: params[:id])
      render 'show'
    else
      render json: { error: "no movie id provided"}
    end
  end

  def create
    p params
    movie = Movie.new(title: params[:title],
                      release_date: params[:release_date],
                      genre: params[:genre])
    if movie.save
      render json: movie
    else
      render json: { error: "movie did not save"}
    end
  end
end
