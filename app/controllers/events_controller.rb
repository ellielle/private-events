class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @user = current_user
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event created"
      redirect_to profile_path
    else
      render :new
    end
  end

  def show
    # TODO hide old events in a collapsed area
    @event = Event.find_by(slug: params[:slug]) # TODO REWRITE
  end

  def index
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:title, :body, :date, :location)
  end
end
