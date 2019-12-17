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

  # DELETE /events/:id
  def destroy
    get_event # Sets event to @event variable 
    @event.destroy
    #head :no_content
  end

  # GET /events/:id
  def show
    @event = get_event
    json_response( @event )
  end

  # PUT /events/:id
  def update
    @event = get_event
    @event.update( event_params )
    json_response( @event )
  end

  private 
    def event_params
      params.permit( :title, :description, :people, :location, :category, :start_time, :end_time, :date )
    end

    def get_event
      @event = Event.find( params[ :id ] )
    end

end
