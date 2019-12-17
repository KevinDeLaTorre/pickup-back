class EventsController < ApplicationController

  def index
    @todos = Event.all
    json_response( @todos )
  end

end
