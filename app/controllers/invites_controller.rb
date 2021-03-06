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
    redirect_to session.delete(:return_to), notice: "Status updated!"
  end

  private

  def invite_params
    params.require(:invite).permit(:status, :team)
  end

  WEBHOOK_URL = ENV["DISCORD_URL2"].freeze

  # def please_get_to_work
  #   require 'discordrb/webhooks'


  #   client = Discordrb::Webhooks::Client.new(url: WEBHOOK_URL)
  #   client.execute do |builder|
  #     builder.content = 'Hello world!'
  #     builder.add_embed do |embed|
  #       embed.title = 'Embed title'
  #       embed.description = 'Embed description'
  #       embed.timestamp = Time.now
  #     end
  #   end
  # end

  def application_discord(user, team)
    require 'discordrb/webhooks'

    client = Discordrb::Webhooks::Client.new(url: WEBHOOK_URL)
    client.execute do |builder|
      builder.content = "@administrator NEW Application!"
      builder.add_embed do |embed|
        embed.title = "Waiting for approval"
        embed.url = "https://clanparty.herokuapp.com/teams/#{team.id}/"
        # change LINK to clanparty.net later!!!
        embed.description = "[#{user.username}](https://clanparty.herokuapp.com/teams/#{user.id}/) would like to join the team!"
        embed.timestamp = Time.now
      end
    end
  end

end
