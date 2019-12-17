class EventsController < ApplicationController

  # GET /events
  def index
    @events = Event.all
    json_response( @events )
  end

  # POST /events
  def create
    @event = Event.create!( event_params )
    json_response( @event, :created ) # Returns status ok if created
  end

  private 
    def event_params
      params.permit( :title, :description, :people, :location, :category, :start_time, :end_time, :date )
    end

    def set_event
      @event = Event.find( params[ :id ] )
    end

end
