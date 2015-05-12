class CreateMoviesGenres < ActiveRecord::Migration
  def change
    create_table :movies_genres, id: false do |t|
      t.belongs_to :movie, index: true, null: false
      t.belongs_to :genre, index: true, null: false
    end
  end
end
