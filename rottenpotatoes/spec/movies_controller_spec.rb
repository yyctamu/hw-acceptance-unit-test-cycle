require 'rails_helper'

describe MoviesController do
    
  describe 'Find Movies with Same Director' do
    it 'should select Movie.common_movies' do
      get :director_common, { title: 'Amelie' }
      expect(assert(:director_common_movies)).to eql(movies)
    end
  describe '.ratings' do
    it 'returns ratings' do
      expect(Movie.ratings).to match ["G" "PG" "PG-13" "NC-17" "R"]
    end
  end
    it 'should have common movies if director exists' do
      movies = ['Amelie', 'David']
      movies_directors = directors.and_return(['David',movies])
      expect(Movie).to receive(:director_common_movies).with('David')
      get :director_common, { title: 'Amelie' }
    end
  describe 'director not exist' do
      it 'should call sad path' do
        expect(Movie.director_common_movies(title: "David")).to eql(["Amelie"])
      end
    end
  
end
end 
   


