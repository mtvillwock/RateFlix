class CreateGenreMovies < ActiveRecord::Migration
  def change
    create_table :genre_movies do |t|
      t.belongs_to :movie, index: true, null: false
      t.belongs_to :genre, index: true, null: false
    end
  end
end
