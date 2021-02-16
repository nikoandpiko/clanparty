class TeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @teams = policy_scope(Team)
    @users = User.all
  end

  def show
    @team = Team.find(params[:id])
    @user = User.find(params[:id])
    authorize @team
  end

  def new
    @team = Team.new
    authorize @team
  end

  def create
    team_params[:game_id] == "" ? team_params[:game_id] = nil :

    @game = Game.find(team_params[:game_id])
    @team = Team.new(
      game: @game,
      user: current_user,
      name: team_params[:name],
      status: team_params[:status],
      discord: team_params[:discord],
      bio: team_params[:bio],
      avatar: team_params[:avatar]
    )
    authorize @team

    if @team.save
      redirect_to teams_path, notice: "Team successfully created"
    else
      render :new, notice: "Please fill in the necessary information"
    end
  end

  private

  def team_params
    params.require(:team).permit(:game_id, :name, :status, :discord, :bio, :avatar)
  end
end
