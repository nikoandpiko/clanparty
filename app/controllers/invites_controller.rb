class InvitesController < ApplicationController
  # before_action :find_team, only: [ :update ]

  def update
    @invite = Invite.find(params[:id])
    authorize @invite
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to), notice: "Status updated!"
  end

  private

  # def invite_params
  #   params.require(:invite).permit(:status)
  # end

  # def find_team
  #   @team = Team.find(@invite.team_id)
  # end
end
