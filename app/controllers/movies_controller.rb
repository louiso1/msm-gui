class MoviesController < ApplicationController
  
  def update
    movie_id = params.fetch("the_id")
    movie = Movie.where({ :id => movie_id}).first

    movie.title = params.fetch("the_title")
    movie.year = params.fetch("the_year")
    movie.duration = params.fetch("the_duration")
    movie.description = params.fetch("the_description")
    movie.image = params.fetch("the_image")
    movie.director_id = params.fetch("the_director_id")
    movie.save

    redirect_to("/movies/#{movie_id}")
  end


  def create
    # params hash looks like this:
    # {"the_title"=>"1", "the_year"=>"2", "the_duration"=>"3", "the_description"=>"4", "the_image"=>"5", "the_director_id"=>"6"}

    m = Movie.new
    m.title = params.fetch("the_title")
    m.year = params.fetch("the_year")
    m.duration = params.fetch("the_duration")
    m.description = params.fetch("the_description")
    m.image = params.fetch("the_image")
    m.director_id = params.fetch("the_director_id")
    m.save

    redirect_to("/movies")
  end

  def destroy
    movie_id = params.fetch("movie_id")
    movie = Movie.where({ :id => movie_id }).first
    movie.destroy
    redirect_to("/movies")
  end
  
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })

  end
end
