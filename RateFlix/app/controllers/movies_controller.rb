class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    if !params[:id].nil?
    @movie = Movie.find(params[:id])
    render json: @movie
    # how to do this as a partial?
  end
  def create
    p params
    movie = Movie.new(title: params[:title],
                      release_date: params[:release_date],
                      genre: params[:genre])
    if movie.save
      redirect '/'
    else
      render json: { error: "movie did not save"}
    end
  end
end
