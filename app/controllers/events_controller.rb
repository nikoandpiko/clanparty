class EventsController < ApplicationController
  before_action :find_team, only: [ :new ]

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @team = Team.find(params[:team_id])
    # @accepted = Invite.where(team_id: @team.id)
    @event.team = @team
    authorize @event

    if @event.save
      sleep(1.5)
      # raise
      sent_event_discord(@event.name, @event.description, @event.day, @event.start_time, @event.end_time, @team)
      redirect_to team_path(@team)
    else
      redirect_to team_path(@team), notice: "Please enter all information"
    end
  end

  private

  def find_team
    @team = Team.find(params[:team_id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :day, :start_time, :end_time)
  end
  # WEBHOOK_URL = ENV["DISCORD_URL"]
  WEBHOOK_URL = 'https://discord.com/api/webhooks/817030712401330176/_rXms5NGitxqwPbyoBXu-teAcYi3zZJN7TrDDAlzWLe_UJyJZy3mDTTJ34nwaYQLOllX'.freeze

  def sent_event_discord(event_title, description, day, start_time, end_time, team)
    require 'discordrb/webhooks'

    client = Discordrb::Webhooks::Client.new(url: WEBHOOK_URL)
    client.execute do |builder|
      builder.content = "Z@Zhere NEW Event!"
      builder.add_embed do |embed|
        embed.title = event_title
        embed.url = "https://clanparty.herokuapp.com/teams#{team.id}/"
        # change LINK to clanparty.net later!!!
        embed.description = "#{description}!"
        embed.add_field(name: 'Day', value: day, inline: true)
        embed.add_field(name: 'Time', value: "#{start_time} - #{end_time}", inline: true)
        embed.image = Discordrb::Webhooks::EmbedImage.new(url: Event::EVENT_IMAGE[event_title])
        embed.timestamp = Time.now
      end
    end
  end
end
