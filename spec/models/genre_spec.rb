require 'rails_helper'
require 'faker'

RSpec.describe Genre, type: :model do
  context 'model validations and associations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :tmdb_id }
    it { should validate_uniqueness_of :tmdb_id }
    it { should have_many :genre_movies }
    it { should have_many(:movies).through(:genre_movies) }
  end

  context 'valid Genre' do
    it 'is valid with a name and tmdb_id' do
      genre = Genre.new(:tmdb_id => 12, :name => "Western")
      expect(genre).to be_valid
    end
  end

  context 'invalid Genre' do
    it 'is invalid without a name' do
      genre = Genre.new(:tmdb_id => 123, :name => "")
      expect(genre).to be_invalid
    end
    it 'is invalid without a TMDB id' do
      genre = Genre.new(:tmdb_id => "", :name => "Thriller")
      expect(genre).to be_invalid
    end
    it 'is invalid without a unique TMDB id' do
      genre1 = Genre.create(:tmdb_id => 123, :name => "Action")
      genre2 = Genre.new(:tmdb_id => 123, :name => "Romance")
      expect(genre2).to be_invalid
    end
  end
end
