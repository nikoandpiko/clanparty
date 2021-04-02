class InvitesController < ApplicationController
  def edit; end

  def new
    @invite = Invite.new
    authorize @invite
  end

  def create
    @team = Team.find(params[:team_id])
    @invite = Invite.new(
      user: current_user,
      status: 2,
      team: @team
    )
    authorize @invite
    application_discord(@invite.user, @team)
    if @invite.save
      sleep(1.5)
      # sent_application_discord(@invite.user, @team)
      redirect_to team_path(@team)
    else
      redirect_to teams_path
      # render :new, notice: "ERROR"
    end
  end

  def update
    @invite = Invite.find(params[:id])
    authorize @invite
    # @team = Team.where(team_id: @invite)
    # @specific_team = Invite.where(team_id: @team)
    @invite.update(invite_params)
    session[:return_to] ||= request.referer
    case @invite.status
    when 1
      accepted_discord(@invite.user)
    when 0
      declined_discord(@invite.user, @invite.team)
    end
    redirect_to session.delete(:return_to), notice: "Status updated!"
  end

  private

  def invite_params
    params.require(:invite).permit(:status, :team)
  end

  WEBHOOK_URL = ENV["DISCORD_URL2"]

  def application_discord(user, team)
    require 'discordrb/webhooks'

    client = Discordrb::Webhooks::Client.new(url: WEBHOOK_URL)
    client.execute do |builder|
      builder.content = "<@&817023909378654228> NEW Application!"
      builder.add_embed do |embed|
        embed.color = 2815
        embed.title = "Waiting for approval"
        embed.url = "http://www.clanparty.net/teams/#{team.id}/"
        # change LINK to clanparty.net later!!!
        embed.description = "[#{user.nickname}](http://www.clanparty.net/users/#{user.id}/) would like to join the team!\n\nVote:\n:white_check_mark: or :x:"
        embed.timestamp = Time.now
      end
    end
  end

  def accepted_discord(user)
    require 'discordrb/webhooks'

    client = Discordrb::Webhooks::Client.new(url: WEBHOOK_URL)
    client.execute do |builder|
      builder.content = "<@!#{user.discord}> Congratulations!"
      builder.add_embed do |embed|
        embed.color = 65_321
        embed.title = "Check out events channel"
        # embed.url = "<#817030626846048306>"
        # change LINK to clanparty.net later!!!
        embed.description = "You have been accepted. #{user.nickname} be sure to check out events channel. Trial events are MUST!"
        embed.timestamp = Time.now
      end
    end
  end

  def declined_discord(user, team)
    require 'discordrb/webhooks'

    client = Discordrb::Webhooks::Client.new(url: WEBHOOK_URL)
    client.execute do |builder|
      builder.content = "<@!#{user.discord}> Denied!"
      builder.add_embed do |embed|
        embed.color = 16_711_680
        embed.title = "Denied to join team"
        embed.url = "http://www.clanparty.net/teams/#{team.id}/"
        # change LINK to clanparty.net later!!!
        embed.description = "Your request has unfortunately been denied. We kindly ask you to leave the channel!"
        embed.timestamp = Time.now
      end
    end
  end
end
