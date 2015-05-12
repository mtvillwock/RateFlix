class RemoveMovieIdFromGenres < ActiveRecord::Migration
  def change
    remove_column :genres, :movie_id, :integer
  end
end
