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
    if @invite.save
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

end
