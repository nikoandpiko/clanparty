class TeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @teams = policy_scope(Team)
    @users = User.all
  end

  def show
    @team = Team.find(params[:id])
    authorize @team
  end

  def new
    @team = Team.new
    authorize @team
  end
end
