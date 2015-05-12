class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.integer :tmdb_id
      t.integer :movie_id
      t.string :name
    end
  end
end
