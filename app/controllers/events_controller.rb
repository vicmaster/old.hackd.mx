class EventsController < ApplicationController
  before_action :find_event, only: [ :edit, :show ]
  before_action :event_params, only: [ :update ]

  def index
    @events = Event.all
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(@params)
      flash[:notice] = "Event updated successfully" 
      redirect_to events_path
    else
      flash[:notice] = "Event wasn't updated as expected" 
      redirect_to :back 
    end
  end

  def destroy
  end

  private
  def event_params
     @params = params.require(:event).permit(:name, :details, :location)
  end

  def find_event
     @event = Event.find(params[:id])
   end


end
