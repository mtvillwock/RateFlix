require 'rails_helper'
require 'faker'

RSpec.describe Review, type: :model do
  context 'model validations and associations' do
    it { should validate_presence_of :movie_id }
    it { should validate_presence_of :user_email }
    it { should validate_presence_of :date_published }
    it { should validate_presence_of :rating }
    it { should belong_to :movie }
  end

  context 'valid Review' do
    it 'is valid with a user email, date published, rating, and movie id' do
      review = Review.new(:movie_id => 1, :user_email => "joe@aol.com", :date_published => "1940-12-25", :rating => 8)
      expect(review).to be_valid
    end
  end

  context 'invalid Review' do
    it 'is invalid without a rating' do
      review = Review.new(:movie_id => 1, :user_email => "joe@aol.com", :date_published => "1940-12-25", :rating => "")
      expect(review).to be_invalid
    end
    it 'is invalid without a date published' do
      review = Review.new(:movie_id => 1, :user_email => "joe@aol.com", :date_published => "", :rating => 7)
      expect(review).to be_invalid
    end
    it 'is invalid without a movie id' do
      review = Review.new(:movie_id => "", :user_email => "joe@aol.com", :date_published => "1940-12-25", :rating => 9)
      expect(review).to be_invalid
    end
    it 'is invalid without a user email' do
      review = Review.new(:movie_id => "", :user_email => "", :date_published => "1940-12-25", :rating => 9)
      expect(review).to be_invalid
    end
  end
end
