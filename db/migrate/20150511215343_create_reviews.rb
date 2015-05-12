class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :movie_id
      t.string :user_email
      t.date :date_published
      t.integer :rating
      t.text :comment
    end
  end
end
