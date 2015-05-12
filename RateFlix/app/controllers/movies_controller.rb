class MoviesController < ApplicationController
  include MoviesHelper
  def index
    @movie = Movie.new
    @movies = Movie.all
    render 'index'
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    @genres = @movie.genres
    @reviews =  @movie.reviews
    @review = Review.new(user_email: params[:user_email],
                         rating: params[:rating].to_s,
                         date_published: params[:date_published],
                         comment: params[:comment],
                         movie_id: @movie.id)
    render 'show'
  end

  def create
    title = params[:movie][:title]
    @movie = Movie.find_by(title: title)
    p @movie
    if @movie
      redirect_to "/movies/#{@movie.id}"
    elsif
      response = search(title)
      @movie = Movie.create!(title: response[:title],
                             release_date: response[:release_date],
                             tmdb_id: response[:tmdb_id])
      p @movie
      genres = find_movie_genres(@movie.tmdb_id.to_s)
      build_movie_genres(movie: @movie, genres: genres)
    else
      render json: {error: "movie failed to be found"}
    end
  end

  def update
    if params[:id] == "genre"
      @movies = Movie.all
      @genres_and_movies = zip_genre_to(@movies)
      render json: @genres_and_movies
    elsif params[:id] == "title"
      @movies_by_title = Movie.order(title: :asc)
      @genres_and_movies = zip_genre_to(@movies_by_title)
      render json: @genres_and_movies
    elsif params[:id] == "release_date"
      @movies_by_release_date = Movie.order(release_date: :asc)
      @genres_and_movies = zip_genre_to(@movies_by_release_date)
      render json: @genres_and_movies
    else
      render json: {error: "sort call failed"}
    end
  end
end
