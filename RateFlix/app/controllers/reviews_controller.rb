class ReviewsController < ApplicationController

  def create
    p params
    p params[:review]
    p params[:date_published]
     year = params[:date_published][:year]
     month = params[:date_published][:month]
     day = params[:date_published][:day]
     date_published = "#{year}-#{month}-#{day}"
    review = Review.create!(movie_id: params[:movie_id],
                        user_email: params[:review][:user_email],
                        date_published: date_published,
                        rating: params[:review][:rating].to_i,
                        comment: params[:review][:comment])
    if review
      redirect_to "/movies/#{review.movie_id}"
    else
      render json: { error: "Review didn't save" }
    end
  end
end
