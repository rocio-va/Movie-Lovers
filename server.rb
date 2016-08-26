require 'sinatra'
require 'sinatra/reloader'
require 'imdb'

require './lib/game'
require './lib/match'
require './lib/movie'

require 'pry'

enable(:sessions)

get '/' do
    erb :index
end

post '/search_movie' do
    movie = params[:movie]
    movies = Game.search_movies(movie)
    if(movies != false)
        match = Match.new(movies)
        session.clear
        #binding.pry
        session[:match] = match
        redirect to '/show_movies'
    else
        redirect to '/'
    end

end

get '/show_movies' do
    @question = session[:match].question
    @movies = session[:match].movies
    binding.pry
    erb :show_movies
end

get '/select_answer/:index' do
    index = params[:index].to_i
    match =session[:match]
    if(match.evaluate_answer(index))
        redirect to '/win'
    else
        redirect to '/try_again'
    end
end

get '/win' do
    erb :win
end

get '/try_again' do
    erb :try_again
end
