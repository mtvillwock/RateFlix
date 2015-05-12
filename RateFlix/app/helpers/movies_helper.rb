require 'httparty'
module MoviesHelper
  include HTTParty
  BASE_URI = 'https://api.themoviedb.org/3'

  def genre_list
    # https://api.themoviedb.org/3/genre/movie/list?api_key=ENV['API_KEY']
    # returns JSON of all genre ids that when parsed
    genre_list_response = HTTParty.get(BASE_URI + "/genre/movie/list?api_key=" + ENV['API_KEY'])
    # looks like: { "genres": [ {id: id, name: name }, { id: id, name: name} ] }
    genres_array = genre_list_response.parsed_response["genres"]
  end

  def build_genres(genres)
    genre_list.each do |genre|
      genre = Genre.new(tmdb_id: genre["id"], name: genre["name"])
      genre.save
      p genre
    end
  end

  def find_movie_genres(id)
    p movie_id = id.to_s
    p response = HTTParty.get(BASE_URI + "/movie/#{movie_id}?api_key=" + ENV['API_KEY'])
    p movie_genres = response.parsed_response["genres"]
  end

  def build_movie_genres(args)
    p args
    movie = args[:movie]
    genres = args[:genres]
    movie_genres = []
    genres.each do |genre|
      p genre
      movie_genres << GenreMovie.create!(movie_id: movie.id, genre_id: Genre.find_by(tmdb_id: genre["id"]).id)
    end
    p movie_genres
  end

  def search(title)
    p title_query_string = title.downcase.split(" ").join("%20")
    # splits title if multiple words and joins with %20 for spaces
    # http://api.themoviedb.org/3/search/movie?query=die%20hard&api_key=ENV['API_KEY']
    response = HTTParty.get(BASE_URI + "/search/movie" + "?query=#{title_query_string}&api_key=" + ENV['API_KEY'])
    movies_array = response.parsed_response["results"]
    # should return collection of movies with that title
    # parse through array of results for movie hash with title == input title
    @movie_json = {}
    movies_array.each do |movie|
      p title
      p movie["title"]
      p movie
      if movie["title"].downcase == title.downcase
        return @movie_json = { title: movie["title"],
                         release_date: movie["release_date"],
                         tmdb_id: movie["id"].to_i }
      end
    end
  end

  def zip_genre_to(movies)
    genres = []
    movies.each do |movie|
        genres << movie.genres.first.name
      end
    genres_and_movies = genres.zip(movies)
  end
end
