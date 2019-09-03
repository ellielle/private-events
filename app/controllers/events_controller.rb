class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @user = current_user
    @event = current_user.events.build(event_params)
    if @event.save
      @event.attendances.create(attendee_id: @user.id)
      flash[:success] = "Event created"
      redirect_to profile_path
    else
      render :new
    end
  end

  def show
    @event = Event.friendly.find(params[:id])
  end

  def index
    @expired = Event.past
    @upcoming = Event.upcoming
  end

  private

  def event_params
    params.require(:event).permit(:title, :body, :date, :location)
  end
end
