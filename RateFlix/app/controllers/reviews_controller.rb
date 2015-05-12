class ReviewsController < ApplicationController
  def create
    p params
    review = Review.new(movie_id: params[:movie_id],
                        user_email: params[:user_email],
                        date_published: params[:date_published],
                        rating: params[:rating],
                        comment: params[:comment])
    if review.save
      render json: review
    else
      render json: { error: "Review didn't save" }
    end
  end
end
