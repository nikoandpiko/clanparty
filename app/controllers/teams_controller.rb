class TeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  skip_before_action :verify_authenticity_token

  def index
    @teams = policy_scope(Team)
    @users = User.all
  end

  def show
    @team = Team.find(params[:id])
    @user = User.where(team_id: @team.id)
    @event = Event.new
    @invite = Invite.new
    @accepted_member = Invite.accepted.where(team_id: @team.id)
    @pending_member = Invite.pending.where(team_id: @team.id)
    @declined_member = Invite.declined.where(team_id: @team.id)
    # @unassigned_member = Invite.unassigned.where(team_id: @team.id)
    @applicant = current_user
    @members_of_a_team = []
    @accepted_member.each do |member|
      @members_of_a_team << member.user
    end
    @members_of_a_team << @user[0]
    authorize @team
  end

  def new
    @team = Team.new
    authorize @team
  end

  def create
    team_params[:game_id] = nil if team_params[:game_id] = ""

    @game = Game.find(team_params[:game_id])
    @team = Team.new(
      game: @game,
      user_id: current_user.id,
      name: team_params[:name],
      status: team_params[:status],
      discord: team_params[:discord],
      bio: team_params[:bio]
      # avatar: team_params[:avatar]
    )

    authorize @team

    if @team.save
      current_user.team_id = @team.id
      current_user.save
      redirect_to teams_path, notice: "Team successfully created"
    else
      render :new, notice: "Please fill in the necessary information"
    end
  end

  def edit
    @team = Team.find(params[:id])
    authorize @team
  end

  def update
    @team = Team.find(params[:id])
    authorize @team
    @team.update(team_params)
    redirect_to team_path(@team)
  end

  private

  def team_params
    params.require(:team).permit(:game_id, :name, :status, :discord, :bio, :avatar, :monday_start, :monday_end, :tuesday_start, :tuesday_end, :wednesday_start, :wednesday_end, :thursday_start,
                                 :thursday_end, :friday_start, :friday_end, :saturday_start, :saturday_end, :sunday_start, :sunday_end, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
  end
end
