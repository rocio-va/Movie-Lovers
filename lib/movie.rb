class Movie
    attr_reader :title, :year, :poster, :director
    def initialize (title, year, poster, director)
        @title = title
        @year = year
        @poster = poster
        @director = director
    end
end