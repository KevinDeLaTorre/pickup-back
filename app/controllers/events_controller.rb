class EventsController < ApplicationController
  before_action :set_event, only: [ :show, :update, :destroy ]

  # GET /api/events
  def index
    @events = Event.order(date: :desc, start_time: :desc).includes(:followers)
    json_response( @events )
  end

  # POST /api/events
  def create
    @event = Event.create!( event_params )
    json_response( @event, :created ) # Returns status ok if created
  end

  # DELETE /api/events/:id
  def destroy
    @event.destroy
    #head :no_content
  end

  # GET /api/events/:id
  def show
    json_response( @event )
  end

  # PUT /api/events/:id
  def update
    @event.update( event_params )
    json_response( @event )
  end

  private

  def event_params
    params.permit( :title, :description, :people, :location, :category, :start_time, :end_time, :date )
  end

  def set_event
    @event = Event.find( params[ :id ] )
  end
end
