require 'imdb'
class Game 
    def self.search_movies(movie_search)
        all_movies = Imdb::Search.new(movie_search).movies
        choose_movies(all_movies)
    end
    def self.choose_movies(all_movies)
        i = 0
        #array que va a contener las peliculas de la partida
        movies = []
        while(movies.length < 9 && all_movies.length > i)
            if(all_movies[i].poster != nil)
                movies.push all_movies[i]
            end
            i += 1
        end
        if(movies.length == 9)
            movies
        else
            false
        end
    end
end