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
      sent_event_discord(params[:name])
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
  WEBHOOK_URL = 'https://discord.com/api/webhooks/817030712401330176/_rXms5NGitxqwPbyoBXu-teAcYi3zZJN7TrDDAlzWLe_UJyJZy3mDTTJ34nwaYQLOllX'.freeze

  def sent_event_discord(name)
    require 'discordrb/webhooks'

    client = Discordrb::Webhooks::Client.new(url: WEBHOOK_URL)
    client.execute do |builder|
      builder.content = '@here NEW Event!'
      builder.add_embed do |embed|
        embed.title = name
        embed.description = 'Raid until your eyes start to bleed!'
        embed.timestamp = Time.now
      end
    end
  end
end
