class ActorsController < ApplicationController
  
  def create
    actor = Actor.new
    actor.name = params.fetch("query_name")
    actor.dob = params.fetch("query_dob")
    actor.bio = params.fetch("query_bio")
    actor.image = params.fetch("query_image")
    actor.save
    redirect_to("/actors")
  end


  def update
    id = params.fetch("id")
    actor = Actor.where({ :id => id}).first
    actor.name = params.fetch("query_name")
    actor.dob = params.fetch("query_dob")
    actor.bio = params.fetch("query_bio")
    actor.image = params.fetch("query_image")
    actor.save
    redirect_to("/actors/#{id}")
  end


  def destroy
    id = params.fetch("actor_id")
    match = Actor.where({ :id => id })
    actor = match.at(0)
    actor.destroy
    redirect_to("/actors")
  end
  
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
end
