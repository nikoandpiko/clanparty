class EventsController < ApplicationController
  before_action :find_team, only: [ :new ]

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @team = Team.find(params[:team_id])
    @event.team = @team
    authorize @event

    if @event.save
      sleep(1.5)
      redirect_to team_path(@team)
     
    else
      redirect_to team_path(@team), notice: "Please enter all information"
      raise
    end
  end

  private

  def find_team
    @team = Team.find(params[:team_id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :day, :start_time, :end_time)
  end
end
