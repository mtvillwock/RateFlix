class MoviesController < ApplicationController
  include MoviesHelper
  def index
    @movies = Movie.all
    render 'index'
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    @review = Review.new(user_email: params[:user_email],
                         rating: params[:rating].to_s,
                         date_published: params[:date_published],
                         comment: params[:comment],
                         movie_id: @movie.id)
    render 'show'
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
