class TeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @teams = policy_scope(Team)
    @users = User.all

    @each_teams_members = []
    @teams.each do |team|
      @accepted_members = Invite.accepted.where(team_id: team.id)
      @team_leader = User.where(team_id: team.id)
      @accepted_members.each do |invite|
        @user = invite.user
        @each_teams_members << @user
        
      end
      @each_teams_members << @team_leader[0]
    end

    # @each_teams_members.each_with_index do |member, index|
    #   if !member.team_id.nil?
    #     @each_teams_members.slice(", ")
    #   end

 raise
   
    end

# NEED TO SPLIT MEMBERS INTO SEPARATE ELEMENTS


   


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
