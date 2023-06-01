class MoviesController < ApplicationController
    def index
        @movies = Movie.all
        if params[:query].present?
            # method 1
            # @movies = @movies.where("title ILIKE ?", "%#{params[:query]}%")

            # method 2
            # sql_subquery = "title ILIKE :query OR synopsis ILIKE :query"
            # @movies = @movies.where(sql_subquery, query: "%#{params[:query]}%")

            # method 3
            # sql_subquery = <<~SQL
            # movies.title ILIKE :query
            # OR movies.synopsis ILIKE :query
            # OR directors.first_name ILIKE :query
            # OR directors.last_name ILIKE :query
            # SQL
            # @movies = @movies.joins(:director).where(sql_subquery, query: "%#{params[:query]}%")
        
            # method 4
            # sql_subquery = <<~SQL
            # movies.title @@ :query
            # OR movies.synopsis @@ :query
            # OR directors.first_name @@ :query
            # OR directors.last_name @@ :query
            # SQL
            # @movies = @movies.joins(:director).where(sql_subquery, query: params[:query])

            # method 5
            # @movies = Movie.search_by_title_and_synopsis(params[:query])

            
        end
    end
end
