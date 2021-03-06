class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      flash.notice = "Event '#{@event.name}' created!"
      redirect_to event_path(@event)
    else
      flash.notice = "Event '#{@event.name}' creation failed."
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date)
  end
end
