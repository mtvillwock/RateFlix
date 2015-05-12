# Movie Review Site
Rails 4 app for rating and reviewing movies.

Working with a 3rd party API populate data for movies.


## Requirements:
Use an AJAX call to a 3rd party API to produce a list of movies.

You should be able to sort by Title, Release Date, Genre

-Title: http://api.themoviedb.org/3/search/movie
- Release date: http://api.themoviedb.org/3/movie/id/releases
-Genre: http://api.themoviedb.org/3/genre/movie/list

<!-- -http://api.themoviedb.org/3/movie/id (movie id will be different than DB id, use to match with title for search) -->

-- might need some AR scoping here, or else clever front-end rendering

You should be able to create a review in your database for any movie in the list.

  - Review must include a user email
  - Review must include the date
  - Review must include a rating (x out of y)
  - Review may optionally contain a comment


You should be able to view any movie's reviews

-- Need a reviews#show or index route. /movies/:id/reviews
-- Or just show all reviews for a movie on its page. movies#show

You should be able to view all reviews in the database

Write tests/specs in your preferred test library
