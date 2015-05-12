require 'rails_helper'
require 'faker'

RSpec.describe Movie, type: :model do
  context 'model validations and associations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :release_date }
    it { should validate_presence_of :tmdb_id }
    it { should validate_uniqueness_of :tmdb_id }
    it { should have_many :reviews }
    it { should have_many :genre_movies }
    it { should have_many(:genres).through(:genre_movies) }
  end

  context 'valid Movie' do
    it 'is valid with a title, release_date, and tmdb_id' do
      movie = Movie.new(title: "Galaxy Quest", release_date: "1999-12-23", tmdb_id: 926)
      expect(movie).to be_valid
    end
  end

  context 'invalid Movie' do
    it 'is invalid without a title' do
      movie = Movie.new(title: "", release_date: "2000-01-01", tmdb_id: 1234)
      expect(movie).to be_invalid
    end
    it 'is invalid without a release date' do
      movie = Movie.new(title: "something", release_date: "", tmdb_id: 1234)
      expect(movie).to be_invalid
    end
    it 'is invalid without a TMDB id' do
      movie = Movie.new(title: "something", release_date: "", tmdb_id: "")
      expect(movie).to be_invalid
    end
    it 'is invalid without a unique TMDB id' do
      movie1 = Movie.create(title: "something", release_date: "1990-12-25", tmdb_id: 1234)
      movie2 = Movie.new(title: "another thing", release_date: "1999-09-12", tmdb_id: 1234)
      expect(movie2).to be_invalid
    end
  end
end
