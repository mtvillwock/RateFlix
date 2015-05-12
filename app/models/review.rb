class Review < ActiveRecord::Base
  belongs_to :movie

  validates_presence_of :movie_id, :user_email, :date_published, :rating
end
