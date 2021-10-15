class Movie < ActiveRecord::Base
    def self.ratings 
        
        ary = []
        Movie.select(:rating).distinct.each{ |w| ary.push(w.rating) }
        ary.sort
        
    end 
    
    #################################################################
    def self.same_director_movies director_name
        
        similar_movie = Movie.find_by(title: director_name)
        same_director = Movie.find_by(title: director_name).director
        
        if same_director.blank?
            return similar_movie,nil
        elsif same_director.nil?
            return similar_movie,nil
        end 
        
        dir_movies = Movie.where(director: same_director)
        same_director_movies =  dir_movies.pluck(:title)
        
        return similar_movie, same_director_movies
    end
    ####################################################################
end