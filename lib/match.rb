require 'imdb'
require './lib/movie'
require 'pry'
class Match
    attr_reader :movies, :question, :answer
    def initialize(movies)
        @movies = create_movies(movies)
        question_answer = create_question
        @question = question_answer[0]
        @answer = question_answer[1]
    end
    def create_movies(movies_imdb)
        movies_imdb.map do |movie_imdb|
            movie = Movie.new(movie_imdb.title, movie_imdb.year, movie_imdb.poster, movie_imdb.director)
        end
    end
    def question_year
        #genero un num random 0 o 8
        prng = Random.new
        opcion = prng.rand(0..8)
        binding.pry
        year = @movies[opcion].year
        ["¿Qué película se estrenó el año #{year}?", year]
    end
    def question_director
        #genero un num random 0 o 8
        prng = Random.new
        opcion = prng.rand(0..8)
        binding.pry
        director = @movies[opcion].director[0]
        ["¿Qué película fue dirigida por #{director}?", director]
    end
    def create_question
        #genero un num random 0 o 1
        prng = Random.new
        opcion = prng.rand(0..1)
        if(opcion == 1)
            question_year()
        else
            question_director()
        end
    end
    def evaluate_answer(index)
        if(@answer.instance_of?(Fixnum))
            @answer == @movies[index].year
        else
            @answer == @movies[index].director[0]
        end
    end
end